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
XTDDXPConfiguratorTest >> testRequestUserNameReturnsProvidedIdentifier [
        configurator userName: 'participant-99'.

        self assert: configurator requestUserName equals: 'participant-99'
]
