//
//  Node.m
//  ios.stage-task
//
//  Created by Mikhail Lazarau on 23.05.21.
//

#import "Node.h"

@implementation Node

-(instancetype)initWithKey: (NSNumber*)k position: (int)p {
	self = [super init];
	if (self) {
		_key = k;
        _position = p;
//        _childs = [NSPointerArray strongObjectsPointerArray];
//        [_childs addPointer: CFBridgingRetain(_left)];
//        [_childs addPointer: CFBridgingRetain(_right)];
	}
	return self;
}

+(instancetype)createBinaryTree: (NSMutableArray *)arr position:(int)position {
    if (arr.count == 0) {
        return Nil;
    }
    
    id val = arr.firstObject;
    [arr removeObjectAtIndex:0];
    
    if ([val isKindOfClass: [NSNull class]])
    {
        return Nil;
    }
    Node* node = [[Node alloc] initWithKey:val position:position];
    
    node.left = [self createBinaryTree:arr position:position+1];
    node.right = [self createBinaryTree:arr position:position+1];
    
    return node;
}

// Recursive function to build a BST from a preorder sequence.
//+(Node*) constructBST: (NSArray*)preorder start:(NSInteger)start end:(NSInteger)end {
//	// base case
//	if (start>end)
//	{
//		return Nil;
//	}
//
//	// Construct the root node of the subtree formed by keys of the
//	// preorder sequence in range `[start, end]`
//	Node* node = [[Node alloc] initWithKey:preorder[start] position:@(start)];
//
//	// search the index of the first element in the current range of preorder
//	// sequence larger than the root node's value
//	NSInteger i;
//	for (i=start; i<=end; i++)
//	{
//        if([preorder[i] compare:node.key] == NSOrderedDescending)
//		{
//			break;
//		}
//	}

	// recursively construct the left subtree
//	node.left = [self constructBST:preorder start: start + 1 end: i - 1];
//
//	// recursively construct the right subtree
//	node.right = [self constructBST:preorder start: i end: end];
//
//	// return current node
//	return node;
//}

+(int) BTHeight: (Node*)root {
    if (root == Nil)
    {
        return 0;
    }
    int leftTHeight = [self BTHeight: root.left];
    int rightTHeight = [self BTHeight: root.right];

    return MAX(leftTHeight, rightTHeight)+1;
}

+(void) inorder: (Node*)root aggregator: (NSMutableArray*) arr  {
	if (root == Nil) {
        return;
	}
    [arr[root.position] addObject:root.key];
	[self inorder: root.left aggregator: arr];
    [self inorder: root.right aggregator: arr];
}

@end
