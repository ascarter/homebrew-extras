cask 'python3-sdk' do
  version '3.10.1'
  sha256 'f3837587ed22d23689d390eaf0892741362adcea25771beed8e753cc71e1e3ec'

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
