Class {
	#name : #BaselineOfXTDDXP,
	#superclass : #BaselineOf,
	#category : #BaselineOfXTDDXP
}

{ #category : #baselines }
BaselineOfXTDDXP >> baseline: spec [

	<baseline>
	spec baseline: 'DebuggingSpy' with:[
		spec repository: 'github://StevenCostiou/DebuggingSpy'].
	
	spec baseline: 'PharoXPEventRecorder' with: [ 
		spec repository:
			'github://Pharo-XP-Tools/DebuggingSpy-EventRecorder:main' ].

	spec for: #common do: [ 
		spec postLoadDoIt: #postload:package:.
		spec package: 'XTDDXP' ]
]

{ #category : #actions }
BaselineOfXTDDXP >> postload: loader package: packageSpec [

	UIManager default
		informUser: 'Instrumenting image. Please wait...'
		during: [ 
			(self class environment at: #XTDDXPConfigurator)
				configureExperiment ]
]
