cask "fedora-media-writer-nosign" do
  version "5.2.8"
  sha256 "06e4762a52358c5e3f382539b1e29cc838381b3a4ad7ec8995f2cbba7cfbf396"

  url "https://github.com/FedoraQt/MediaWriter/releases/download/#{version}/" \
      "FedoraMediaWriter-osx-arm64-#{version}.dmg",
      verified: "github.com/FedoraQt/MediaWriter/"
  name "Fedora Media Writer"
  desc "Write Fedora images to portable media. Unsigned version"
  homepage "https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"
  depends_on arch: :arm64

  app "FedoraMediaWriter.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/FedoraMediaWriter.app"]
  end

  zap trash: [
    "~/Library/Caches/fedoraproject.org",
    "~/Library/Saved Application State/org.fedoraproject.MediaWriter.savedState",
  ]
end
