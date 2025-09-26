Class {
	#name : 'XTDDXPConfiguratorTestUIManager',
	#superclass : 'Object',
	#instVars : [
		'nextAnswer'
	],
	#category : 'XTDDXP-Tests-Mock',
	#package : 'XTDDXP-Tests',
	#tag : 'Mock'
}

{ #category : 'accessing' }
XTDDXPConfiguratorTestUIManager >> nextAnswer: anObject [
        nextAnswer := anObject
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestUIManager >> request: aString initialAnswer: anotherString [
        ^ nextAnswer
]
