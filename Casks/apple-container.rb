cask "apple-container" do
  version "1.2.2"
  sha256 "f4c7e73f7203725a3512676dfd9ec6c6a98a37093b6fd4a1b0fdcfcb227e2118"

  url "https://github.com/apple/container/releases/download/#{version}/" \
      "container-#{version}-installer-signed.pkg",
      verified: "github.com/apple/container/"
  name "Container"
  desc "Create and run Linux containers in lightweight virtual machines"
  homepage "https://github.com/apple/container"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe
  depends_on arch: :arm64

  pkg "container-#{version}-installer-signed.pkg"

  uninstall script: {
    executable: "/usr/local/bin/uninstall-container.sh",
    args:       ["-k"],
    sudo:       true,
  },
            pkgutil: "com.apple.container-installer"

  zap trash: [
    "~/Library/Application Support/com.apple.container",
    "~/Library/Preferences/com.apple.container.defaults.plist",
  ]
end
