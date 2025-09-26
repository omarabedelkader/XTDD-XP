"
I configure user ids and loggers for the XTDDXP first exploration.
"
Class {
	#name : 'XTDDXPConfigurator',
	#superclass : 'Object',
	#category : 'XTDDXP',
	#package : 'XTDDXP'
}

{ #category : 'configuration' }
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

{ #category : 'accessing' }
XTDDXPConfigurator >> instrumenterClass [

	(self class environment includesKey: #DSSpyInstrumenter)
        ifTrue: [ ^ (self class environment at: #DSSpyInstrumenter) ].
    ^ XTDDXPNullInstrumenter
]

{ #category : 'configuration' }
XTDDXPConfigurator >> newLogger [

	(self class environment includesKey: #DSEventRecorderLogger)
		ifTrue: [ ^ (self class environment at: #DSEventRecorderLogger) new ].
	^ XTDDXPNullLogger new
]

{ #category : 'configuration' }
XTDDXPConfigurator >> removeERRecorderFromSettings [

        | eventRecorderSettingsClass |
        (self class environment includesKey: #EREventRecorderSettings)
                ifFalse: [ ^ self ].
        eventRecorderSettingsClass := self class environment at: #EREventRecorderSettings.
        eventRecorderSettingsClass class compile:'urlSettingsOn: aBuilder
        (aBuilder setting: #stringUrl)
                parent: #Tools;
                target: self;
                description: ''The default URL for the Event Recorder server.'';
                label: ''Event Recorder URL address''
'
]

{ #category : 'requests' }
XTDDXPConfigurator >> requestUserName [

	| input |
	input := self uiManager
		         request: 'Please provide your XTDD unique id:'
		         initialAnswer: ''.
	(#( nil '' ) includes: input) ifTrue: [ ^ self ].

	^ input
]

{ #category : 'accessing' }
XTDDXPConfigurator >> spyClass [

	(self class environment includesKey: #DSSpy)
        ifTrue: [ ^ (self class environment at: #DSSpy) ].
    ^ XTDDXPNullSpy
]

{ #category : 'accessing' }
XTDDXPConfigurator >> uiManager [
	^ UIManager default
]
