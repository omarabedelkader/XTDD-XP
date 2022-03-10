"
I configure user ids and loggers for the XTDDXP first exploration.
"
Class {
	#name : #XTDDXPConfigurator,
	#superclass : #Object,
	#category : #XTDDXP
}

{ #category : #configuration }
XTDDXPConfigurator >> configureExperiment [
	
	|concreteLogger userId|
	userId := self requestUserName ifNil:[^self].
	concreteLogger := self newLogger.
	concreteLogger setExperiment: nil.
	concreteLogger projectName: 'xtdd'.
	concreteLogger participantUUID: userId.
	self spyClass logger: concreteLogger.
	self instrumenterClass instrumentSystem

]

{ #category : #accessing }
XTDDXPConfigurator >> instrumenterClass [
	^(self class environment at: #DSSpyInstrumenter)
]

{ #category : #configuration }
XTDDXPConfigurator >> newLogger [
	^(self class environment at: #DSEventRecorderLogger) new
]

{ #category : #requests }
XTDDXPConfigurator >> requestUserName [

	| input |
	input := UIManager default
		         request: 'Type selector:'
		         initialAnswer: ''.
	(#( nil '' ) includes: input) ifTrue: [ ^ self ].

	^ input
]

{ #category : #accessing }
XTDDXPConfigurator >> spyClass [
	^(self class environment at: #DSSpy)
]
