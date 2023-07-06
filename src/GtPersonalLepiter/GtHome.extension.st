Extension { #name : #GtHome }

{ #category : #'*GtPersonalLepiter' }
GtHome >> personalLepiterSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'My Personal Lepiter';
		description: 'Jefferson''s Lepiter Database';
		databaseName: 'My Personal Lepiter';
		startPageName: 'Personal Lepiter';
		priority: 8
]
