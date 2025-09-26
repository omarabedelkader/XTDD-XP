Class {
	#name : 'XTDDXPConfiguratorTestSpy',
	#superclass : 'Object',
	#classInstVars : [
		'Logger'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'initialization' }
XTDDXPConfiguratorTestSpy class >> logger [
        ^ Logger
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestSpy class >> logger: aLogger [
        Logger := aLogger
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestSpy class >> reset [
<script>
        Logger := nil
]
