Class {
	#name : 'XTDDXPConfiguratorTestUIManager',
	#superclass : 'Object',
	#instVars : [
		'nextAnswer'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'accessing' }
XTDDXPConfiguratorTestUIManager >> nextAnswer: anObject [
        nextAnswer := anObject
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestUIManager >> request: aString initialAnswer: anotherString [
        ^ nextAnswer
]
