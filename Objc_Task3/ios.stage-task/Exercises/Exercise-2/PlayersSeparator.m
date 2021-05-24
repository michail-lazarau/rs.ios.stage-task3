#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {

    int count = 0;
    
    if (ratingArray.count < 2) return count;

	for (int a = 0; a < ratingArray.count-2; a++)
	{
		for (int b = a+1; b<ratingArray.count-1; b++) {

			for (int c = b+1; c<ratingArray.count; c++)
			{
				if (([ratingArray[a] compare:ratingArray[b]] == NSOrderedAscending && [ratingArray[b] compare:ratingArray[c]] == NSOrderedAscending) || ([ratingArray[a] compare:ratingArray[b]] == NSOrderedDescending && [ratingArray[b] compare:ratingArray[c]] == NSOrderedDescending))
				{
					count++;
				}
			}
		}
	}
    
    return count;

//	for (int a = 0; a < ratingArray.count-2; a++)
//	{
//		for (int b = a+1; b<ratingArray.count-1; b++) {
//			if ([ratingArray[a] compare:ratingArray[b]] == NSOrderedAscending)
//			{
//				for (int c = b+1; c<ratingArray.count; c++)
//				{
//					if ([ratingArray[b] compare:ratingArray[c]] == NSOrderedAscending)
//					{
//						count++;
//					}
//				}
//			}
//		}
//	}
}

@end
