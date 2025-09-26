Class {
	#name : 'XTDDXPConfiguratorTestInstrumenter',
	#superclass : 'Object',
	#classInstVars : [
		'Instrumented'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'initialization' }
XTDDXPConfiguratorTestInstrumenter class >> hasInstrumented [

        ^ Instrumented = true
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestInstrumenter class >> instrumentSystem [
        Instrumented := true
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestInstrumenter class >> reset [
<script>
        Instrumented := false
]
