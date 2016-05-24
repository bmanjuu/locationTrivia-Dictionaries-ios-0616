//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length{
    
    NSLog(@"dictionary: %@\n\n\n\n\n\n\n\n\n\n", location);
    NSString *locationName = location[@"name"];
    
    if([locationName length] > length){
        locationName = [locationName substringToIndex:length];
    }
    
    return locationName;
}



-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    NSMutableDictionary *locationDictionary = [[NSMutableDictionary alloc] init];
    
    locationDictionary[@"name"] = name;
    locationDictionary[@"latitude"] = @(latitude); //need to be NSNumber format; cannot store primitives
    locationDictionary[@"longitude"] = @(longitude);
    
    return locationDictionary;
}



-(NSArray *)namesOfLocations:(NSArray *)locations{
    //should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
    
    //locations is an array of dictionaries!! so need to have NSDictionary*location in the for loop
    NSMutableArray *locationsArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *location in locations){
        [locationsArray addObject:[location valueForKey:@"name"]];
    }
    
    NSLog(@"locations: %@\n\n\n\n\n\n", locations);
    
    return locationsArray;
}



-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    
    BOOL validLocation = NO;
    NSArray *dictionaryKeys = [dictionary allKeys];
    
    if([dictionaryKeys containsObject:@"name"] && [dictionaryKeys containsObject:@"latitude"] && [dictionaryKeys containsObject:@"longitude"] && [dictionaryKeys count] == 3){
            validLocation = YES;
        }
    
    return validLocation;
}



-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    //should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.
    //locations is an array of dictionaries
    
    NSLog(@"locations: %@\n\n\n\n\n\n\n", locations);
    
    NSDictionary *chosenLocation = [[NSMutableDictionary alloc] init];
    
    for(NSDictionary *location in locations){
        if([location[@"name"] isEqualToString:name]){
            chosenLocation = location;
        }
    }
    
    if([chosenLocation count] == 0){
        chosenLocation = nil;
    }
    
    return chosenLocation;
}


@end
