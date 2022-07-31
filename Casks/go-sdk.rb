cask 'go-sdk' do
  version '1.18.4'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 'ed5093acc099dfc4ab14cb5d5bc51d9f6694240d5eed25942f0d85f9995ba3f8'
  else
    sha256 '7f7726eae9c295cc148ae33457cf650c6b088ead027229e5256a312919187f88'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
