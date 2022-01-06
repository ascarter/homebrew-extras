cask 'go-sdk' do
  version '1.17.6'
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  if Hardware::CPU.intel?
    sha256 '306fb15dd69572c78b8804fe913c04a88697474866a97c42c21bfc2d771ce977'
  else
    sha256 'a81584c25bbc0de1ea32dccf386c3d1b5d16400a3b2cdef0205233df1d7057cd'
  end

  url "https://go.dev/dl/go#{version}.darwin-#{arch}.pkg"
  appcast 'https://github.com/golang/go/releases.atom'
  name 'Go Programming Language'
  homepage 'https://golang.org'
  depends_on macos: ">= :mojave"

  pkg "go#{version}.darwin-#{arch}.pkg"

  uninstall pkgutil: 'org.golang.go'
end
