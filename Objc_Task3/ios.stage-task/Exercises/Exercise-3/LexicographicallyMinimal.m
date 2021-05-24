#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal ()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(instancetype)init {
    self = [super init];
    if (self) {
        _resultString = [[NSMutableString alloc] init];
    }
    return self;
}

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

	NSMutableString *mtblString1 = [string1 mutableCopy];
	NSMutableString *mtblString2 = [string2 mutableCopy];
	NSRange range = NSMakeRange(0, 1);

	while (mtblString1.length && mtblString2.length !=0)
	{
		if ([mtblString1 characterAtIndex:0] <= [mtblString2 characterAtIndex:0])
		{
			[_resultString appendString:[mtblString1 substringWithRange: range]];
			[mtblString1 deleteCharactersInRange: range];
		} else
		{
			[_resultString appendString:[mtblString2 substringWithRange: range]];
			[mtblString2 deleteCharactersInRange: range];
		}
	}

	return [[_resultString stringByAppendingString:mtblString1] stringByAppendingString:mtblString2];
}

@end
