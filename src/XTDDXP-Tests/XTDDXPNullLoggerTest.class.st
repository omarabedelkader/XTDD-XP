Class {
	#name : 'XTDDXPNullLoggerTest',
	#superclass : 'TestCase',
	#category : 'XTDDXP-Tests-Tests',
	#package : 'XTDDXP-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
XTDDXPNullLoggerTest >> testAuthorizeDataSendingReturnsLogger [

	| logger |
	logger := XTDDXPNullLogger new.
	self assert: logger authorizeDataSending identicalTo: logger
]

{ #category : 'tests' }
XTDDXPNullLoggerTest >> testNullLoggerStoresExperimentData [

	| logger experiment |
	logger := XTDDXPNullLogger new.
	experiment := XTDDXPExperiment new.

	logger setExperiment: experiment.
	logger projectName: 'xtdd'.
	logger participantUUID: 'participant-1'.
	self assert: logger experiment identicalTo: experiment.
	self assert: logger projectName equals: 'xtdd'.
	self assert: logger participantUUID equals: 'participant-1'
]
