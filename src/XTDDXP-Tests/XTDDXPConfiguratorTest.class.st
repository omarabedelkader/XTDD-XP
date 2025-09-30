Class {
	#name : 'XTDDXPConfiguratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'configurator',
		'previousAuthor',
		'previousEpMonitor'
	],
	#category : 'XTDDXP-Tests-Tests',
	#package : 'XTDDXP-Tests',
	#tag : 'Tests'
}

{ #category : 'running' }
XTDDXPConfiguratorTest >> setUp [
| environment |
	super setUp.
	XTDDXPConfiguratorTestInstrumenter reset.
	XTDDXPConfiguratorTestSpy reset.
	        XTDDXPConfiguratorTestAuthor reset.
        configurator := XTDDXPConfiguratorTestDouble new.
        environment := configurator class environment.
        previousAuthor := (environment includesKey: #Author)
                ifTrue: [ environment at: #Author ]
                ifFalse: [ #XTDDXPAbsent ].
        previousEpMonitor := (environment includesKey: #EpMonitor)
                ifTrue: [ environment at: #EpMonitor ]
                ifFalse: [ #XTDDXPAbsent ].
        environment at: #Author put: XTDDXPConfiguratorTestAuthor.
        environment at: #EpMonitor put: XTDDXPConfiguratorTestEpMonitor
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> tearDown [
        | environment |
        environment := configurator class environment.
        previousAuthor = #XTDDXPAbsent
                ifTrue: [ environment removeKey: #Author ifAbsent: [ ] ]
                ifFalse: [ environment at: #Author put: previousAuthor ].
        previousEpMonitor = #XTDDXPAbsent
                ifTrue: [ environment removeKey: #EpMonitor ifAbsent: [ ] ]
                ifFalse: [ environment at: #EpMonitor put: previousEpMonitor ].
        super tearDown
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testConfigureExperimentSetsUpLoggingAndInstrumentation [

	configurator userName: 'participant-42'.

	configurator configureExperiment.

	self
		assert: configurator logger experiment experienceId
		equals: 'xtdd-experiment'.
	self assert: configurator logger projectName equals: 'xtdd'.
	self
		assert: configurator logger participantUUID
		equals: 'participant-42'.
	self assert: configurator logger authorized.
	self
		assert: XTDDXPConfiguratorTestSpy logger
		identicalTo: configurator logger.
	self assert: XTDDXPConfiguratorTestInstrumenter hasInstrumented.
	self assert: configurator removedERRecorder
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testConfigureExperimentUsesTemporaryAuthorName [
        | author |
        author := XTDDXPConfiguratorTestAuthor uniqueInstance.
        author fullName: 'Existing Author'.

        configurator userName: 'participant-7'.
        configurator configureExperiment.

        self assert: author fullNamePerSe equals: 'Existing Author'.
        self assert: author setupNameWasAssigned
]

{ #category : 'running' }
XTDDXPConfiguratorTest >> testRequestUserNameReturnsProvidedIdentifier [
        configurator userName: 'participant-99'.

        self assert: configurator requestUserName equals: 'participant-99'
]
