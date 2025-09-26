Class {
	#name : 'XTDDXPConfiguratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'configurator'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'running' }
XTDDXPConfiguratorTest >> setUp [
        super setUp.
        XTDDXPConfiguratorTestInstrumenter reset.
        XTDDXPConfiguratorTestSpy reset.
        configurator := XTDDXPConfiguratorTestDouble new
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testConfigureExperimentConfiguresLoggerAndRestoresAuthorName [
        configurator userName: 'user-42'.

        configurator configureExperiment.

        self assert: configurator removedERRecorder.
        self assert: XTDDXPConfiguratorTestInstrumenter hasInstrumented.
        self assert: XTDDXPConfiguratorTestSpy logger identicalTo: configurator logger.
        self assert: configurator logger experiment class equals: XTDDXPExperiment.
        self assert: configurator logger projectName equals: 'xtdd'.
        self assert: configurator logger participantUUID equals: 'user-42'.
        self assert: configurator logger authorized.
        self assert: configurator author fullName equals: configurator author initialName
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testConfigureExperimentSkipsSetupWhenUserDeclines [
        configurator userName: nil.

        configurator configureExperiment.

        self deny: configurator removedERRecorder.
        self deny: XTDDXPConfiguratorTestInstrumenter hasInstrumented.
        self assert: XTDDXPConfiguratorTestSpy logger isNil.
        self assert: configurator logger isNil.
        self assert: configurator author fullName equals: configurator author initialName
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testRequestUserNameReturnsNilForBlankAnswer [
        configurator userName: ''.

        self assert: configurator requestUserName isNil
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testRequestUserNameReturnsNilForNilAnswer [
        configurator userName: nil.

        self assert: configurator requestUserName isNil
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testRequestUserNameReturnsProvidedIdentifier [
        configurator userName: 'participant-99'.

        self assert: configurator requestUserName equals: 'participant-99'
]
