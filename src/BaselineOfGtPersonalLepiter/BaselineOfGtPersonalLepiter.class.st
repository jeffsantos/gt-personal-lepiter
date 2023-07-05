Class {
	#name : #BaselineOfGtPersonalLepiter,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtPersonalLepiter
}

{ #category : #loading }
BaselineOfGtPersonalLepiter class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-personal-lepiter' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtPersonalLepiter >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtPersonalLepiter'
		]
]
