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

	EpMonitor disableDuring: [ 
		| userId currentAuthorName concreteLogger |
		userId := self requestUserName ifNil: [ ^ self ].
		currentAuthorName := Author uniqueInstance fullNamePerSe.
		Author uniqueInstance fullName: 'XXTDDSetup'.
		self removeERRecorderFromSettings.
		concreteLogger := self newLogger.
		concreteLogger setExperiment: XTDDXPExperiment new.
		concreteLogger projectName: 'xtdd'.
		concreteLogger participantUUID: userId.
		self spyClass logger: concreteLogger.
		self instrumenterClass instrumentSystem.
		Author uniqueInstance fullName: currentAuthorName.
		concreteLogger authorizeDataSending.
		 ]
]

{ #category : #accessing }
XTDDXPConfigurator >> instrumenterClass [
	^(self class environment at: #DSSpyInstrumenter)
]

{ #category : #configuration }
XTDDXPConfigurator >> newLogger [
	^(self class environment at: #DSEventRecorderLogger) new
]

{ #category : #configuration }
XTDDXPConfigurator >> removeERRecorderFromSettings [
	EREventRecorderSettings class compile:'urlSettingsOn: aBuilder 

	(aBuilder setting: #stringUrl)
		parent: #Tools;
		target: self;
		description: ''The default URL for the Event Recorder server.'';
		label: ''Event Recorder URL address''
'
	
]

{ #category : #requests }
XTDDXPConfigurator >> requestUserName [

	| input |
	input := UIManager default
		         request: 'Please provide your XTDD unique id:'
		         initialAnswer: ''.
	(#( nil '' ) includes: input) ifTrue: [ ^ self ].

	^ input
]

{ #category : #accessing }
XTDDXPConfigurator >> spyClass [
	^(self class environment at: #DSSpy)
]
