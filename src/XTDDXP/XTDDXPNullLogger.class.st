Class {
	#name : 'XTDDXPNullLogger',
	#superclass : 'Object',
	#instVars : [
		'experiment',
		'projectName',
		'participantUUID'
	],
	#category : 'XTDDXP',
	#package : 'XTDDXP'
}

{ #category : 'logging' }
XTDDXPNullLogger >> authorizeDataSending [
    ^ self
]

{ #category : 'logging' }
XTDDXPNullLogger >> experiment [
    ^ experiment
]

{ #category : 'logging' }
XTDDXPNullLogger >> participantUUID [
    ^ participantUUID
]

{ #category : 'logging' }
XTDDXPNullLogger >> participantUUID: anIdentifier [
    participantUUID := anIdentifier
]

{ #category : 'logging' }
XTDDXPNullLogger >> projectName [
    ^ projectName
]

{ #category : 'logging' }
XTDDXPNullLogger >> projectName: aString [
    projectName := aString
]

{ #category : 'logging' }
XTDDXPNullLogger >> setExperiment: anExperiment [
    experiment := anExperiment
]
