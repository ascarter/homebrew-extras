cask 'go-sdk' do
  version '1.19'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 '61cb2268c4b3e6662a19c2dda58d43bfcf89d3649c205bcdb32c148e9048b1ba'
  else
    sha256 '167cd1107886c36fda76404e82d1447ebd3efc472fd9a9fe3b2e872d41adf981'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
