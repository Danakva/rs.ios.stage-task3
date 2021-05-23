#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if (!ratingArray || ratingArray.count < 3) {
        return 0;
    }
    int result = 0;
    for (int i = 0; i < ratingArray.count - 2; i++) {
        for (int j = i+1; j < ratingArray.count - 1; j++) {
            for (int k = j+1; k < ratingArray.count; k++) {
                if ((ratingArray[i].doubleValue < ratingArray[j].doubleValue) == (ratingArray[j].doubleValue < ratingArray[k].doubleValue)) {
                    result++;
                }
            }
        }
    }
    return result;
}

@end
