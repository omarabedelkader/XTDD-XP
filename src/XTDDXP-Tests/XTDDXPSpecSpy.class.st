Class {
	#name : 'XTDDXPSpecSpy',
	#superclass : 'Object',
	#instVars : [
		'baselineRepositories',
		'groupPackages',
		'groupPostLoadSelectors',
		'packageDependencies',
		'currentBaseline',
		'currentGroup',
		'currentPackage'
	],
	#category : 'XTDDXP-Tests-Mock',
	#package : 'XTDDXP-Tests',
	#tag : 'Mock'
}

{ #category : 'initialization' }
XTDDXPSpecSpy >> baseline: baselineName with: aBlock [
    currentBaseline := baselineName.
    aBlock valueWithPossibleArgument: self.
    currentBaseline := nil
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> for: groupSymbol do: aBlock [
    currentGroup := groupSymbol.
    aBlock valueWithPossibleArgument: self.
    currentGroup := nil
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> initialize [
    super initialize.
    baselineRepositories := Dictionary new.
    groupPackages := Dictionary new.
    groupPostLoadSelectors := Dictionary new.
    packageDependencies := Dictionary new.
    currentBaseline := nil.
    currentGroup := nil.
    currentPackage := nil
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> package: packageName [
    | packages |
    packages := groupPackages
        at: currentGroup
        ifAbsentPut: [ OrderedCollection new ].
    packages add: packageName.
    ^ packageName
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> package: packageName with: aBlock [
    self package: packageName.
    currentPackage := packageName.
    aBlock valueWithPossibleArgument: self.
    currentPackage := nil
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> packagesForGroupNamed: aSymbol [
    ^ (groupPackages at: aSymbol ifAbsent: [ #() ]) asArray
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> postLoadDoIt: aSelector [
    currentGroup ifNil: [ ^ self ].
    groupPostLoadSelectors at: currentGroup put: aSelector
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> postLoadDoItForGroupNamed: aSymbol [
    ^ groupPostLoadSelectors at: aSymbol ifAbsent: [ nil ]
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> repository: aString [
    currentBaseline ifNil: [ ^ self ].
    baselineRepositories at: currentBaseline put: aString
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> repositoryForBaselineNamed: aString [
    ^ baselineRepositories at: aString ifAbsent: [ nil ]
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> requirementsForPackageNamed: aString [
    ^ (packageDependencies at: aString ifAbsent: [ #() ]) asArray
]

{ #category : 'initialization' }
XTDDXPSpecSpy >> requires: requirementCollection [
    currentPackage ifNil: [ ^ self ].
    packageDependencies
        at: currentPackage
        put: requirementCollection asOrderedCollection
]
