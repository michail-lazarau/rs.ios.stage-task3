#import "LevelOrderTraversal.h"
#import "Node.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray *mutableTree = [tree mutableCopy];
//    [mutableTree removeObjectIdenticalTo:[NSNull null]];
    
//    NSInteger n = mutableTree.count;
//    Node* root = [Node constructBST:mutableTree start:0 end:n-1];
    Node* root = [Node createBinaryTree:mutableTree position:0];

    NSMutableArray *gatheringArr = [NSMutableArray new];
    
    int height = [Node BTHeight:root];
    
    for (int i = 0; i < height; i++)
    {
        [gatheringArr addObject: [NSMutableArray new]];
    }
    
    [Node inorder: root aggregator:gatheringArr];
    
    return [gatheringArr copy];
}


