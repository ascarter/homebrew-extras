cask 'go-sdk' do
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"

  version '1.17.5'
  if Hardware::CPU.intel?
    sha256 '7eb86164c3e6d8bbfba3e4cd30b1f1bd532505594fba2ddf6da6f9838582aab2'
  else
    sha256 'de15daae84a371e3ec45340dbabd657eeca483b35264cd112200ed1026b9e38c'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"
  binary "/usr/local/go/bin/go"
  binary "/usr/local/go/bin/gofmt"

  uninstall pkgutil: 'org.golang.go'
end
