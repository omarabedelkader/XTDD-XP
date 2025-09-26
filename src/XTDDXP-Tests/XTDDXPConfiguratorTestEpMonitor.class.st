Class {
	#name : 'XTDDXPConfiguratorTestEpMonitor',
	#superclass : 'Object',
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'enabling' }
XTDDXPConfiguratorTestEpMonitor class >> disableDuring: aBlock [
        ^ aBlock value
]
