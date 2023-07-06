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
				defaultDatabase reload. Halt now.
			(defaultDatabase databases
				detect: [ :aDatabase | aDatabase databaseName includesSubstring: repositoryName ])
				databaseName: 'My Personal Lepiter']
		ifNone: [ self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtPersonalLepiter >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtPersonalLepiter'
		]
]
