cask 'go-sdk' do
  version '1.18'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 'dbfabbbb6377c225ccf28393ecc7aed55564870fcfb39d797411d6b8693013c6'
  else
    sha256 '7c48130b37a155e709ef1db22d3f40ca17cfdaee0dc9d0cc35d2d7c4e0e3d299'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
