Class {
	#name : 'XTDDXPExperimentTest',
	#superclass : 'TestCase',
	#instVars : [
		'nextAnswer'
	],
	#category : 'XTDDXP-Tests-Tests',
	#package : 'XTDDXP-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
XTDDXPExperimentTest >> testExperienceIdIsStable [
        self assert: XTDDXPExperiment new experienceId equals: 'xtdd-experiment'
]
