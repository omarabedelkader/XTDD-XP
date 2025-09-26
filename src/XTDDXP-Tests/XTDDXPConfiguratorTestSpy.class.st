Class {
	#name : 'XTDDXPConfiguratorTestSpy',
	#superclass : 'Object',
	#classInstVars : [
		'Logger'
	],
	#category : 'XTDDXP-Tests-Mock',
	#package : 'XTDDXP-Tests',
	#tag : 'Mock'
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
