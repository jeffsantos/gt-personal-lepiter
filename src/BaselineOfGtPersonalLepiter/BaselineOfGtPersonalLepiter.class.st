Class {
	#name : #BaselineOfGtPersonalLepiter,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtPersonalLepiter
}

{ #category : #loading }
BaselineOfGtPersonalLepiter class >> loadLepiter [
	| repositoryName |
	repositoryName := 'gt-personal-lepiter'.

	IceRepository registry
		detect: [ :aRepository | aRepository name = repositoryName ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties
				addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
				defaultDatabase reload]
		ifNone: [ self inform: 'Repository not found.' ]
]

{ #category : #loading }
BaselineOfGtPersonalLepiter class >> renameLepiter [
	LeDatabasesRegistry defaultLogicalDatabase databases 
		detect: [ :aDatabase | aDatabase databaseName includesSubstring: 'gt-personal-lepiter' ] 
		ifFound: [ :aDatabase | aDatabase databaseName: 'My Personal Lepiter']
]

{ #category : #baseline }
BaselineOfGtPersonalLepiter >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtPersonalLepiter'
		]
]
