//
//  Node.h
//  ios.stage-task
//
//  Created by Mikhail Lazarau on 23.05.21.
//

#ifndef Node_h
#define Node_h

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property(nonatomic) int position;
@property(nonatomic,strong) NSNumber* key;
@property(nonatomic,strong) Node* left;
@property(nonatomic,strong) Node* right;
//@property(nonatomic,copy) NSPointerArray* childs;

-(instancetype)initWithKey: (NSNumber*)k position:(int)p;
//+(instancetype)constructBST: (NSArray*)preorder start:(NSInteger)start end:(NSInteger)end;
+(instancetype)createBinaryTree: (NSMutableArray *)arr position:(int)position;
+(int)BTHeight: (Node*)root;
+(void)inorder: (Node*)root aggregator: (NSMutableArray*) arr;

@end

#endif /* Node_h */
