cask 'node-installer' do
  version '17.3.0'
  sha256 'f960b616eace93d171a0d15e67c62116aa3c6100eb6266046774cc478487b9d9'

  url "https://nodejs.org/dist/v#{version}/node-v#{version}.pkg"
  appcast 'https://github.com/nodejs/node/releases.atom'
  name 'Node.js'
  homepage 'https://nodejs.org'

  pkg "node-v#{version}.pkg"

  uninstall pkgutil: [
    'org.nodejs.npm.pkg',
    'org.nodejs.node.pkg'
  ]
end
