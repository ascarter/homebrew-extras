cask 'go-sdk' do
  version '1.18.5'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 '83ff8698aded60f3e90c8584e6626eaa31fe92101dbe63a6e92a501197265ee5'
  else
    sha256 '7a27dbe31c9fdd98be83ed6ce76fa5474044a2d960e2f9db8fa92b256dda2e58'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
