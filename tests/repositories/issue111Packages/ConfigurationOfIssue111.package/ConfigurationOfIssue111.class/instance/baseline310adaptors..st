baselines-31
baseline310adaptors: spec
    <version: '3.1.0-adaptors-baseline' imports: #('3.1.0-pharo-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec description: ''.
            spec repository: 'http://www.squeaksource.com/Seaside31'.
            spec
                package: 'Zinc-Seaside'
                with: [ 
                    spec
                        repository: 'http://www.squeaksource.com/ZincHTTPComponents';
                        requires: #('Seaside-Core') ].
            spec
                package: 'Seaside-Swazoo' with: [ spec repository: 'http://www.squeaksource.com/Seaside30LGPL' ];
                package: 'Seaside-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
            spec
                group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo');
                group: 'Zinc' with: #('Zinc-Seaside') ].
    spec
        for: #'pharo'
        do: [ 
            spec
                package: 'Seaside-Adaptors-Comanche' with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
                package: 'KomHttpServerLight' with: [ spec repository: 'http://www.squeaksource.com/KomHttpServer' ];
                package: 'Seaside-Tests-Adaptors-Comanche'
                    with: [ spec requires: #('Seaside-Adaptors-Comanche' 'Seaside-Tests-Pharo-Core') ].
            spec
                group: 'Kom' with: #('Seaside-Adaptors-Comanche');
                group: 'Comanche' with: #('Seaside-Adaptors-Comanche') ].
    spec
        for: #'squeak'
        do: [ 
            spec blessing: #'baseline'.
            spec description: ''.
            spec repository: 'http://www.squeaksource.com/Seaside31'.
            spec
                package: 'WebClient-Seaside'
                with: [ 
                    spec
                        repository: 'http://www.squeaksource.com/WebClient';
                        requires: #('WebClient-Core' 'Seaside-Core') ].
            spec package: 'WebClient-Seaside'.
            spec group: 'WebClient' with: #('WebClient-Seaside') ].
    spec
        for: #'gemstone'
        do: [ 
            spec repository: 'http://seaside.gemstone.com/ss/Seaside30'.
            spec
                package: 'Seaside-Adaptors-Swazoo' with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
                package: 'Zinc-Seaside' with: [ spec includes: #('Seaside-GemStone-Adaptors-Zinc') ];
                package: 'Seaside-Adaptors-FastCGI' with: [ spec requires: #('Seaside-Core') ];
                package: 'Seaside-GemStone-Adaptors-Swazoo' with: [ spec requires: #('Seaside-Adaptors-Swazoo') ];
                package: 'Seaside-GemStone-Adaptors-Zinc' with: [ spec requires: #('Zinc-Seaside') ].
            spec group: 'FastCGI' with: #('Seaside-Adaptors-FastCGI') ]