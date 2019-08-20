"
An InjectIntoIteratorTest is a test class for testing the behavior of InjectIntoIterator
"
Class {
	#name : #InjectIntoIteratorTest,
	#superclass : #IteratorDecoratorTest,
	#category : #'Iterators-Tests-Decorators'
}

{ #category : #'iterator creation' }
InjectIntoIteratorTest >> createIteratorOn: anObject [
	^ (InjectIntoIterator decorate: anObject)
			baseValue: 10;
			accumulationBlock: [ :sum :x | sum + x ];
			yourself
]

{ #category : #accessing }
InjectIntoIteratorTest >> iteratorWalk [
	"Returns the walk that is expected to be done by the iterator under test."
	^ #(65)
]