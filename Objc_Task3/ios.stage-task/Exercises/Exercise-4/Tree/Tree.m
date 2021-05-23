
#import <Foundation/Foundation.h>
#import "Tree.h"

@implementation Tree

-(id)initWith: (NSNumber*)value left:(Tree*)left right:(Tree*)right  {
    self = [super init];
    if (self) {
        _value = value;
        _left = left;
        _right = right;
    }
    return self;
}

+(id)initWithArray: (NSMutableArray*)array {
    if (array.count == 0) {
        return nil;
    }
    id object = array.firstObject;
    [array removeObjectAtIndex:0];
    if (object == [NSNull null]) {
        return nil;
    }
    return [[Tree alloc] initWith:object left:[Tree initWithArray:array] right:[Tree initWithArray:array]];
}

- (int)countOfLevels: (int)level {
    if ([self left] && [self right]) {
        int rightCount = [[self right] countOfLevels:++level];
        int leftCount = [[self left] countOfLevels:++level];
        return rightCount < leftCount ? leftCount : rightCount;
    } else if ([self left]) {
        return [[self left] countOfLevels:++level];
    } else if ([self right]){
        return [[self right] countOfLevels:++level];
    } else {
        return level;
    }
}

- (NSDictionary*)levelsArrays: (int)level dictionary:(NSDictionary*)dict {
    int lev = level;
    lev++;
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    NSString *levelKey = [NSString stringWithFormat:@"%d", level];
    [mutDict setValue:[NSArray arrayWithObject:[self value]] forKey:levelKey];
    if ([self left] && [self right]) {
        NSDictionary *right = [[self right] levelsArrays:lev dictionary: [mutDict copy]];
        NSDictionary *left = [[self left] levelsArrays:lev dictionary: [mutDict copy]];
        mutDict = [[self mergeDictionaries:mutDict with:[self mergeDictionaries:left with:right]] mutableCopy];
        return [mutDict copy];
    } else if ([self left]) {
        NSDictionary *left = [[self left] levelsArrays:lev dictionary: [mutDict copy]];
        return [self mergeDictionaries:mutDict with:left];
    } else if ([self right]) {
        NSDictionary *right = [[self right] levelsArrays:lev dictionary: [mutDict copy]];
        return [self mergeDictionaries:mutDict with:right];
    } else {
        return [mutDict copy];
    }
}

-(NSDictionary*)mergeDictionaries:(NSDictionary*)left with: (NSDictionary*)right {
    NSUInteger max = left.allKeys.count > right.allKeys.count ? left.allKeys.count : right.allKeys.count;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 1; i <= max; i++) {
        NSString *levelKey = [NSString stringWithFormat:@"%d", i];
        NSArray* leftArr = [left valueForKey:levelKey];
        NSArray* rightArr = [right valueForKey:levelKey];
        if(![leftArr isEqualToArray:rightArr]) {
            NSMutableArray* tempArray = [NSMutableArray array];
            [tempArray addObjectsFromArray:leftArr];
            [tempArray addObjectsFromArray:rightArr];
            [dict setValue:tempArray forKey:levelKey];
        } else {
            [dict setValue:leftArr forKey:levelKey];
        }
    }
    return [dict copy];
}

@end
