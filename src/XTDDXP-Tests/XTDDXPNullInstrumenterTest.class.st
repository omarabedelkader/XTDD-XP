Class {
	#name : 'XTDDXPNullInstrumenterTest',
	#superclass : 'TestCase',
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'tests' }
XTDDXPNullInstrumenterTest >> testInstrumentSystemDoesNothing [

	self
		assert: XTDDXPNullInstrumenter instrumentSystem
		identicalTo: XTDDXPNullInstrumenter
]
