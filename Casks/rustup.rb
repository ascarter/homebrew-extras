cask 'rustup' do
  version :latest
  sha256 :no_check

  url 'https://static.rust-lang.org/rustup/rustup-init.sh'
  name 'Rust language via rustup installer'
  homepage 'https://www.rust-lang.org/'

  installer script: {
                      executable: "#{staged_path}/rustup-init.sh",
                      args: ['-y', '--no-modify-path']
                    }

  uninstall script: {
                      executable: "#{File.expand_path('~/.cargo/bin/rustup')}",
                      args: ['self', 'uninstall', '-y'],
                      must_succeed: false
                    }
end
