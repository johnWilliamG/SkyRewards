//
//  SRRewardsService.h
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSRewardsDelegate;

@interface SRRewardsService : NSObject

- (void)requestRewardsFromSubscriptions:(NSArray<NSString *> *)subscriptions withCustomerID:(NSString *)customerID;

@property (nonatomic, weak) id <SSRewardsDelegate> delegate;

@end

@protocol SSRewardsDelegate <NSObject>

- (void)didLoadRewards:(NSArray *)rewards;
- (void)didFailToLoadRewardsWithError:(NSString *)error;

@end


