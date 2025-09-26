Class {
	#name : 'XTDDXPNullSpyTest',
	#superclass : 'TestCase',
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'tests' }
XTDDXPNullSpyTest >> testLoggerIsReturnedUnchanged [

	| logger |
	logger := XTDDXPNullLogger new.
	self assert: (XTDDXPNullSpy logger: logger) identicalTo: logger
]
