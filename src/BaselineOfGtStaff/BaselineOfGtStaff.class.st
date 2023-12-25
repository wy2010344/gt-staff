Class {
	#name : #BaselineOfGtStaff,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStaff
}

{ #category : #loading }
BaselineOfGtStaff class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-staff' ]
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
BaselineOfGtStaff >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtStaff'
		]
]
