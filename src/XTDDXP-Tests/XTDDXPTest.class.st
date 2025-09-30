Class {
	#name : 'XTDDXPTest',
	#superclass : 'TestCase',
	#instVars : [
		'spec'
	],
	#category : 'XTDDXP-Tests-Tests',
	#package : 'XTDDXP-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
XTDDXPTest >> setUp [
    super setUp.
    spec := XTDDXPSpecSpy new.
    BaselineOfXTDDXP new baseline: spec
]

{ #category : 'running' }
XTDDXPTest >> testBaselineDeclaresDSSpyEventRecorderDependency [
    self
        assert: (spec repositoryForBaselineNamed: 'DSSpyEventRecorder')
        equals: 'github://Pharo-XP-Tools/DebuggingSpy-EventRecorder:P12'
]

{ #category : 'running' }
XTDDXPTest >> testBaselineDeclaresDebuggingSpyDependency [
    self
        assert: (spec repositoryForBaselineNamed: 'DebuggingSpy')
        equals: 'github://StevenCostiou/DebuggingSpy:P12'
]

{ #category : 'running' }
XTDDXPTest >> testBaselineDefinesCommonGroupPackages [
    self
        assert: (spec packagesForGroupNamed: #common) asSet
        equals: #( 'XTDDXP' 'XTDDXP-Tests' ) asSet
]

{ #category : 'running' }
XTDDXPTest >> testBaselineDefinesPostLoadDoItForCommonGroup [
    self
        assert: (spec postLoadDoItForGroupNamed: #common)
        equals: #postload:package:
]

{ #category : 'running' }
XTDDXPTest >> testTestsPackageDependsOnMainPackage [
    self
        assert: (spec requirementsForPackageNamed: 'XTDDXP-Tests') asSet
        equals: #( 'XTDDXP' ) asSet
]
