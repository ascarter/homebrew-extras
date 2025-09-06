cask "fedora-media-writer-nosign" do
  version "5.2.8"
  sha256 arm:   "06e4762a52358c5e3f382539b1e29cc838381b3a4ad7ec8995f2cbba7cfbf396",
         intel: "5bcfa5c302133aa97b941d1a7b569f321febc3af0693bbc2b8ee55c582f8a5e2"

  on_arm do
    url "https://github.com/FedoraQt/MediaWriter/releases/download/#{version}/" \
        "FedoraMediaWriter-osx-arm64-#{version}.dmg",
        verified: "github.com/FedoraQt/MediaWriter/"
  end
  on_intel do
    url "https://github.com/FedoraQt/MediaWriter/releases/download/#{version}/" \
        "FedoraMediaWriter-osx-#{version}.dmg",
        verified: "github.com/FedoraQt/MediaWriter/"
  end

  name "Fedora Media Writer"
  desc "Write Fedora images to portable media. Unsigned version"
  homepage "https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"

  app "FedoraMediaWriter.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/FedoraMediaWriter.app"]
  end

  zap trash: [
    "~/Library/Caches/fedoraproject.org",
    "~/Library/Saved Application State/org.fedoraproject.MediaWriter.savedState",
  ]
end
