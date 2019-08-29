"
I am an iterator that works similary to #reduce: method.

I evaluate reduce the objects I get from the stream using my #reduceBlock.

Such iterator will return a single object.
"
Class {
	#name : #ReduceIterator,
	#superclass : #AggregatorIteratorDecorator,
	#category : #'Iterators-Decorators'
}

{ #category : #private }
ReduceIterator >> aggregateUpToEnd [
	aggregatedValue := self decoratedIterator next.
	[ self decoratedIterator hasNext ]
		whileTrue: [ 
			aggregatedValue := self reduceBlock value: aggregatedValue value: self decoratedIterator next ]
]

{ #category : #accessing }
ReduceIterator >> reduceBlock [
	^ self block
]

{ #category : #accessing }
ReduceIterator >> reduceBlock: anObject [
	self block: anObject
]