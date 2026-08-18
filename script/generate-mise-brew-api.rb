#!/usr/bin/env ruby
# frozen_string_literal: true

require "cask/cask"
require "fileutils"
require "formula"
require "formulary"
require "json"
require "pathname"
require "tap"

TAP_NAME = "ascarter/extras"

tap = Tap.fetch(TAP_NAME)
raise "#{TAP_NAME} is not installed" unless tap.installed?

Homebrew.with_no_api_env do
  Formulary.enable_factory_cache!
  Formula.generating_hash!
  Cask::Cask.generating_hash!

  formula_directory = Pathname("api/formula")
  cask_directory = Pathname("api/cask")
  FileUtils.mkdir_p([formula_directory, cask_directory])

  generated_formulae = []
  tap.formula_files.sort.each do |path|
    formula = Formulary.factory(path)
    generated_formulae << formula.name
    (formula_directory / "#{formula.name}.json").write("#{JSON.pretty_generate(formula.to_hash_with_variations)}\n")
  end

  generated_casks = []
  tap.cask_files.sort.each do |path|
    cask = Cask::CaskLoader.load(path)
    generated_casks << cask.token
    (cask_directory / "#{cask.token}.json").write("#{JSON.pretty_generate(cask.to_hash_with_variations)}\n")
  end

  Dir.glob(formula_directory / "*.json").each do |path|
    File.delete(path) unless generated_formulae.include?(File.basename(path, ".json"))
  end

  Dir.glob(cask_directory / "*.json").each do |path|
    File.delete(path) unless generated_casks.include?(File.basename(path, ".json"))
  end
end
