Class {
	#name : 'XTDDXPConfiguratorTestLogger',
	#superclass : 'Object',
	#instVars : [
		'experiment',
		'projectName',
		'participantUUID',
		'authorized'
	],
	#category : 'XTDDXP-Tests-Mock',
	#package : 'XTDDXP-Tests',
	#tag : 'Mock'
}

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> authorizeDataSending [
        authorized := true
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> authorized [
        ^ authorized = true
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> experiment [
        ^ experiment
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> participantUUID [
        ^ participantUUID
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> participantUUID: anObject [
        participantUUID := anObject
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> projectName [
        ^ projectName
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> projectName: aString [
        projectName := aString
]

{ #category : 'logging' }
XTDDXPConfiguratorTestLogger >> setExperiment: anExperiment [
        experiment := anExperiment
]
