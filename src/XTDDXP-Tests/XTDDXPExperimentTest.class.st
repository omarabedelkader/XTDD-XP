Class {
	#name : 'XTDDXPExperimentTest',
	#superclass : 'TestCase',
	#instVars : [
		'nextAnswer'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'tests' }
XTDDXPExperimentTest >> testExperienceIdIsStable [
        self assert: XTDDXPExperiment new experienceId equals: 'xtdd-experiment'
]
