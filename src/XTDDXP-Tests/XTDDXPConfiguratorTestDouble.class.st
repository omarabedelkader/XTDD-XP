Class {
	#name : 'XTDDXPConfiguratorTestDouble',
	#superclass : 'XTDDXPConfigurator',
	#instVars : [
		'uiManagerStub',
		'logger',
		'removedERRecorder',
		'authorStub'
	],
	#category : 'XTDDXP-Tests',
	#package : 'XTDDXP-Tests'
}

{ #category : 'initialization' }
XTDDXPConfiguratorTestDouble >> author [
        ^ authorStub
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> authorInstance [
        ^ authorStub
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> eventMonitorClass [
        ^ XTDDXPConfiguratorTestEpMonitor
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestDouble >> initialize [
        super initialize.
        uiManagerStub := XTDDXPConfiguratorTestUIManager new.
        authorStub := XTDDXPConfiguratorTestAuthor new.
        removedERRecorder := false
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> instrumenterClass [
        ^ XTDDXPConfiguratorTestInstrumenter
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> logger [
        ^ logger
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> newLogger [
        logger := XTDDXPConfiguratorTestLogger new.
        ^ logger
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> removeERRecorderFromSettings [
        removedERRecorder := true
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> removedERRecorder [
        ^ removedERRecorder
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> spyClass [
        ^ XTDDXPConfiguratorTestSpy
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> uiManager [
        ^ uiManagerStub
]

{ #category : 'as yet unclassified' }
XTDDXPConfiguratorTestDouble >> userName: anObject [
        uiManagerStub nextAnswer: anObject
]
