"
I am the abstract superclass for all sorting strategies

sole method #sort:
that sorts its argument according to its own strategy
The ordering occurs within the passed collection as does Collection>>sort: 
"
Class {
	#name : #TLSortingStrategy,
	#superclass : #TLObject,
	#category : #'Telescope-Core-Strategy'
}

{ #category : #sorting }
TLSortingStrategy >> sortNodes: aCollectionOfTLNodes [
	self subclassResponsibility 
]
