Class {
	#name : #TLExpandCollapseNodesActionTests,
	#superclass : #TestCase,
	#instVars : [
		'visu'
	],
	#category : #'Telescope-Core-Tests-Actions'
}

{ #category : #running }
TLExpandCollapseNodesActionTests >> setUp [
	visu := TLVisualization new
		generator: TLConnectorTest new;
		yourself
]

{ #category : #tests }
TLExpandCollapseNodesActionTests >> testDefaultCollapse [
	| node action |
	node := visu addNodeFromEntity: 4.
	visu generate.
	action:=(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ]).
	action actionOn: node.
	self assert: visu nodes size equals: 4.
	action actionOn: node.
	self assert: visu nodes size equals: 1.
	self assert: visu nodes first equals: node.
]

{ #category : #tests }
TLExpandCollapseNodesActionTests >> testDefaultExpand [
	| node |
	node := visu addNodeFromEntity: 4.
	visu generate.
	(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ]) actionOn: node.
	self assert: visu nodes size equals: 4.

]

{ #category : #tests }
TLExpandCollapseNodesActionTests >> testExpandInAnotherGroup [
	| node |
	node := visu addNodeFromEntity: 4.
	visu generate.
	(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ] destinationGroup: visu > #childGroup) actionOn: node.
	self assert: visu nodes asArray equals: {node}.
	self assert: (visu > #childGroup) size equals: 3.
	self assert: node outgoingConnections size equals: 3.
	self assert: (node outgoingConnections collect: #toNode) equals: (visu > #childGroup) telescopeEntities
]
