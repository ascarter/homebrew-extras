cask 'python3-sdk' do
  version '3.10.5'
  sha256 '36ff0f2ef1fdd8603042576d206224a76db32a0000e8332877751f86d98abc53'

  url "https://www.python.org/ftp/python/#{version}/python-#{version}-macos11.pkg"
  name 'Python Programming Language'
  homepage 'https://python.org'

  pkg "python-#{version}-macos11.pkg",
    choices: [
      {
        'choiceIdentifier' => "org.python.Python.PythonProfileChanges-#{version}",
        'choiceAttribute'  => 'selected',
        'attributeSetting' => 0
      }
    ]

  uninstall pkgutil: [
    "org.python.Python.PythonFramework-#{version}",
    "org.python.Python.PythonDocumentation-#{version}",
    "org.python.Python.PythonApplications-#{version}",
    "org.python.Python.PythonUnixTools-#{version}"
  ]
end
