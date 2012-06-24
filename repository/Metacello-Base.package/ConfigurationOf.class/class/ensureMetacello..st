private
ensureMetacello: loadList
    "Bootstrap Metacello, retry using alternate repository, if primary repository is not accessible"

    Smalltalk
        at: #'MetacelloProject'
        ifAbsent: [ 
            | retry version error |
            retry := false.
            (Array with: 'http://seaside.gemstone.com/ss/metacello' with: 'http://www.squeaksource.com/metacello')
                do: [ :repositoryUrl | 
                    [ 
                    "bootstrap Metacello"
                    self bootstrapMetacelloFrom: repositoryUrl.
                    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: '1.0-beta.32'.	"load latest version of Metacello from mcz"
                    retry
                        ifTrue: [ 
                            "on retry, use #repositoryOverrides:"
                            version
                                repositoryOverrides:
                                    (Array with: (MCHttpRepository location: repositoryUrl user: '' password: '')) ].
                    version load: loadList.
                    version := (Smalltalk at: #'ConfigurationOfMetacelloPreview') project version: '1.0.0-beta.32.2'.	"load latest version of Metacello from github"
                    retry
                        ifTrue: [ 
                            "on retry, use #repositoryOverrides:"
                            version
                                repositoryOverrides:
                                    (Array with: (MCHttpRepository location: repositoryUrl user: '' password: '')) ].
                    version load: loadList.
                    ^ self ]
                        on: Error
                        do: [ :ex | 
                            error := ex.
                            Transcript
                                cr;
                                show: 'failed ensureMetacello: ';
                                show: ex description printString;
                                show: '...retrying'.	"try again"
                            retry := true.
                            ex return: nil ] ].	"shouldn't get here unless the load failed ... throw an error"
            self error: 'retry with alternate repository failed: ' , error description printString ]