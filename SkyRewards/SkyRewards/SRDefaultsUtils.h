//
//  SRDefaultsUtils.h
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const SRSportsChannelUserDefaultsKey;
FOUNDATION_EXTERN NSString * const SRKidsChannelUserDefaultsKey;
FOUNDATION_EXTERN NSString * const SRMusicChannelUserDefaultsKey;
FOUNDATION_EXTERN NSString * const SRNewsChannelUserDefaultsKey;
FOUNDATION_EXTERN NSString * const SRMoviesChannelUserDefaultsKey;
FOUNDATION_EXTERN NSString * const SRChannelSelected;
FOUNDATION_EXTERN NSString * const SRChannelUnselected;
FOUNDATION_EXTERN NSString * const SRAppKey;

@interface SRDefaultsUtils : NSObject

+ (void)updateDefaultsWith:(NSString *)channel selected:(BOOL)selected withCompletionHandler:(void (^)())completionHandler;

@end
