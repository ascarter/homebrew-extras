cask 'go-sdk' do
  version '1.18.3'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 'a23a24c5528671d444328a36a98056902f699a5a211b6ad5db29ca0c012e0085'
  else
    sha256 '0b1683bdb449b82d8476a8d13cdc0f41a5c1bc3d1c85d37852909e5b3f3bbd81'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
