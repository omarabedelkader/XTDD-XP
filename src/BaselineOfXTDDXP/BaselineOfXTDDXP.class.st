Class {
	#name : 'BaselineOfXTDDXP',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfXTDDXP',
	#package : 'BaselineOfXTDDXP'
}

{ #category : 'baselines' }
BaselineOfXTDDXP >> baseline: spec [

	<baseline>
	spec baseline: 'DebuggingSpy' with:[
		spec repository: 'github://StevenCostiou/DebuggingSpy:P12'].
	
	spec baseline: 'DSSpyEventRecorder' with: [ 
		spec repository:
			'github://Pharo-XP-Tools/DebuggingSpy-EventRecorder:P12' ].

	spec for: #common do: [ 
		spec postLoadDoIt: #postload:package:.
		spec package: 'XTDDXP' ]
]

{ #category : 'actions' }
BaselineOfXTDDXP >> postload: loader package: packageSpec [

	UIManager default
		informUser: 'Instrumenting image. Please wait...'
		during: [ 
			(self class environment at: #XTDDXPConfigurator) new
				configureExperiment ]
]
