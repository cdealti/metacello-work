tests
testFileTreeLoadGithubRefBaseline4
    "ConfigurationOfExternal reference from github://dalehenrich/external:configuration/repository using #project:with: with className:"

    Metacello new
        project: 'BaselineOfGithubRefIV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    self
        validate: 'BaselineOfGithubRefIV'
        registrySize: 2
        expectedConfigurationVersion: nil
        expectedConfigurationRepository: nil
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
    self
        verify: 'External-Core'
        loadedFrom: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository'.
    self
        validate: 'External'
        registrySize: 2
        expectedConfigurationVersion: '0.9'
        expectedConfigurationRepository: 'github://dalehenrich/external:configuration/repository'
        expectedBaselineVersion: 'baseline'
        expectedBaselineRepository: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository'