//
//  AppDelegate.m
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 06/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRAppDelegate.h"
#import "SRDefaultsUtils.h"

@interface SRAppDelegate ()

@end

@implementation SRAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setUpUserDefaultsIfRequired];

    return YES;
}

- (void)setUpUserDefaultsIfRequired {
    
    NSUserDefaults *appDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![appDefaults objectForKey:SRAppKey]) {
        
        //Called only after first launch after install
        NSMutableDictionary *defaults = [NSMutableDictionary new];
        [defaults setObject:SRChannelUnselected forKey:SRSportsChannelUserDefaultsKey];
        [defaults setObject:SRChannelUnselected forKey:SRMoviesChannelUserDefaultsKey];
        [defaults setObject:SRChannelUnselected forKey:SRNewsChannelUserDefaultsKey];
        [defaults setObject:SRChannelUnselected forKey:SRKidsChannelUserDefaultsKey];
        [defaults setObject:SRChannelUnselected forKey:SRMusicChannelUserDefaultsKey];
        
        [appDefaults setObject:defaults forKey:SRAppKey];
        [appDefaults synchronize];
    }
}



@end
