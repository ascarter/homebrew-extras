cask 'go-sdk' do
  version '1.19.1'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 '36705b9d9c41eb9940619b24b1e20c7b644a65ec305b16e778115673f51ef28a'
  else
    sha256 '5da47b1a26ab2c979e46437cb365cf4dfa88c0e077e4e73bbcab5504196ff51d'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
