cask 'python3-sdk' do
  version '3.10.6'
  sha256 '6c62760332dcadffae3c2d84e602a19eddd37ae405c4151caa5aa3a94f61c0e5'

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
