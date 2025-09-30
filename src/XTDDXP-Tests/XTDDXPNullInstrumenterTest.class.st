Class {
	#name : 'XTDDXPNullInstrumenterTest',
	#superclass : 'TestCase',
	#category : 'XTDDXP-Tests-Tests',
	#package : 'XTDDXP-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
XTDDXPNullInstrumenterTest >> testInstrumentSystemDoesNothing [

	self
		assert: XTDDXPNullInstrumenter instrumentSystem
		identicalTo: XTDDXPNullInstrumenter
]
