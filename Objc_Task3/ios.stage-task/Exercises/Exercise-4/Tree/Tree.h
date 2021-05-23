#import <Foundation/Foundation.h>

@interface Tree: NSObject

@property (nonatomic, strong) NSNumber* value;
@property (nonatomic, strong, nullable) Tree* left;
@property (nonatomic, strong, nullable) Tree* right;

-(id)initWith:(NSNumber*)value left:(Tree*)left right:(Tree*)right;
+(id)initWithArray: (NSMutableArray*)array;
- (NSDictionary*)levelsArrays: (int)level dictionary:(NSDictionary*)dict;

@end
