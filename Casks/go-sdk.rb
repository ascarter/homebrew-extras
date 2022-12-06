cask 'go-sdk' do
  version '1.19.4'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 '3ca65ff0606054b076c009d3bb3b8aba0032b75ac690de716be5c44ce57da052'
  else
    sha256 '63f5dd4f94c2a6cde1b035c2373da4d0b95f933f3a0a7169f9f78da953efbb59'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
