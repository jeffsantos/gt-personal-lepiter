Extension { #name : #GtHome }

{ #category : #'*GtPersonalLepiter' }
GtHome >> personalLepiterSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'My Personal Lepiter';
		description: 'Jefferson''s Lepiter Database';
		databaseName: 'jeffsantos\gt-personal-lepiter\lepiter';
		startPageName: 'Personal Lepiter';
		priority: 8
]
