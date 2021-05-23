#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *mutStr1 = [NSMutableString stringWithString:string1];
    NSMutableString *mutStr2 = [NSMutableString stringWithString:string2];
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    
    while(mutStr1.length != 0 || mutStr2.length != 0) {
        if (mutStr1.length == 0) {
            [result appendString:mutStr2];
            break;
        } else if (mutStr2.length == 0) {
            [result appendString:mutStr1];
            break;
        }
        if ([[mutStr1 substringToIndex:1] UTF8String][0] <= [[mutStr2 substringToIndex:1] UTF8String][0]) {
            [result appendString: [mutStr1 substringToIndex:1]];
            mutStr1 = [[mutStr1 substringFromIndex:1] mutableCopy];
        } else {
            [result appendString: [mutStr2 substringToIndex:1]];
            mutStr2 = [[mutStr2 substringFromIndex:1] mutableCopy];
        }
    }
    return [result copy];
}

@end
