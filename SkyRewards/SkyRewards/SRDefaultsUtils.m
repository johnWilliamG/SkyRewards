//
//  SRDefaultsUtils.m
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRDefaultsUtils.h"

NSString * const SRSportsChannelUserDefaultsKey = @"SPORTS";
NSString * const SRKidsChannelUserDefaultsKey = @"KIDS";
NSString * const SRMusicChannelUserDefaultsKey = @"MUSIC";
NSString * const SRNewsChannelUserDefaultsKey = @"NEWS";
NSString * const SRMoviesChannelUserDefaultsKey = @"MOVIES";
NSString * const SRChannelSelected = @"Selected";
NSString * const SRChannelUnselected = @"Unselected";
NSString * const SRAppKey = @"SkyRewards";

@implementation SRDefaultsUtils

+ (void)updateDefaultsWith:(NSString *)channel selected:(BOOL)selected withCompletionHandler:(void (^)())completionHandler {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *newDefaults = [[userDefaults objectForKey:SRAppKey] mutableCopy];
    
    [newDefaults setObject:selected ? SRChannelSelected : SRChannelUnselected forKey:channel];
    [userDefaults setObject:newDefaults forKey:SRAppKey];
    [userDefaults synchronize];
    completionHandler();
}

@end
