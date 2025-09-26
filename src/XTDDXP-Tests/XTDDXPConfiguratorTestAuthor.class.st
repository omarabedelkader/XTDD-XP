Class {
	#name : 'XTDDXPConfiguratorTestAuthor',
	#superclass : 'Object',
	#instVars : [
		'fullName',
		'setupNameAssigned'
	],
	#classInstVars : [
		'UniqueInstance'
	],
	#category : 'XTDDXP-Tests-Mock',
	#package : 'XTDDXP-Tests',
	#tag : 'Mock'
}

{ #category : 'initialization' }
XTDDXPConfiguratorTestAuthor class >> reset [
<script>
        UniqueInstance := nil
]

{ #category : 'initialization' }
XTDDXPConfiguratorTestAuthor class >> uniqueInstance [

        ^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestAuthor >> fullName [
        ^ fullName
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestAuthor >> fullName: aString [
        fullName := aString.
        aString = 'XXTDDSetup'
                ifTrue: [ setupNameAssigned := true ]
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestAuthor >> fullNamePerSe [
        ^ fullName
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestAuthor >> initialize [
        super initialize.
        fullName := 'Original Test Author'.
        setupNameAssigned := false
]

{ #category : 'accessing' }
XTDDXPConfiguratorTestAuthor >> setupNameWasAssigned [
        ^ setupNameAssigned
]
