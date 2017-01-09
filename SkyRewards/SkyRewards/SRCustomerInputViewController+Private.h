//
//  SRCustomerInputViewController+Private.h
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRCustomerInputViewController.h"
#import "SRSubscriptionsTableView.h"
#import "SRRewardsService.h"
#import "SRDefaultsUtils.h"

@interface SRCustomerInputViewController () <SSRewardsDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *customerIDTextField;
@property (nonatomic, strong) IBOutlet SRSubscriptionsTableView *subscriptionsTableView;
@property (nonatomic, strong) SRRewardsService *rewardsService;
@property (nonatomic, strong) NSArray <NSString*>* subscriptions;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

- (IBAction)checkSubscriptionPressed:(id)sender;

@end
