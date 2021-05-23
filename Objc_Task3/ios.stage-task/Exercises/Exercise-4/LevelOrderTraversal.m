#import "LevelOrderTraversal.h"
#import "Tree.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    if (!tree || tree.count == 0 || ![[tree firstObject] isKindOfClass:NSNumber.class]) {
        return @[];
    }
    Tree *root = [Tree initWithArray:[tree mutableCopy]];
    NSDictionary *arraysDict = [root levelsArrays:1 dictionary:[NSDictionary dictionary]];
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *key in [arraysDict.allKeys sortedArrayUsingSelector:@selector(compare:)]) {
        [result addObject: [arraysDict valueForKey:key]];
    }
    return [result copy];
}
