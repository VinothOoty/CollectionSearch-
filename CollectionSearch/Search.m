

#import "Search.h"

@implementation Search


@synthesize brand,status;

-(id)initWithBrandName:(NSString*)thebrandName andStatus:(NSString *)theStatus andExtra:(NSString*)theExtra
{
    self = [super init];
    if(self)
    {
        self.brand =thebrandName;
        self.status =theStatus;
        self.extra =theExtra;
    }
    return self;
}


@end
