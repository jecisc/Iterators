"
An IteratorTest is a test class for testing the behavior of Iterator
"
Class {
	#name : #IteratorTest,
	#superclass : #TestCase,
	#instVars : [
		'iterator'
	],
	#category : #'Iterators-Tests-Core'
}

{ #category : #testing }
IteratorTest class >> isAbstract [
	^ self = IteratorTest
]

{ #category : #'iterator creation' }
IteratorTest >> createIteratorOn: anObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ self subclassResponsibility
]

{ #category : #accessing }
IteratorTest >> objectToWalk [
	^ self subclassResponsibility
]

{ #category : #running }
IteratorTest >> setUp [
	super setUp.
	iterator := self createIteratorOn: self objectToWalk
]

{ #category : #tests }
IteratorTest >> testHasNext [
	self iteratorWalk size timesRepeat: [ 
		self assert: iterator hasNext.
		iterator next ].
	
	self deny: iterator hasNext
]

{ #category : #tests }
IteratorTest >> testNext [
	self iteratorWalk do: [ :object |
		self assert: iterator next equals: object ].
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #tests }
IteratorTest >> testPeek [
	self iteratorWalk do: [ :object |
		self assert: iterator peek equals: object.
		iterator next ].
	
	self should: [ iterator peek ] raise: IteratorIsAtEnd
]