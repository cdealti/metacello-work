baseline of ExternalRefX
externalBaselineRefX: spec
  <baseline>
  spec description: 'MetacelloAbstractBaselineResource>>externalBaselineRefX:'.
  spec
    baseline: 'ExternalX'
      with: [ spec repository: 'globalrepo:Metacello_ExternalX_ExternalRepository_URL' ];
    yourself.
  spec
    group: 'Core' with: #('ExternalX');
    group: 'default' with: #('Core');
    yourself