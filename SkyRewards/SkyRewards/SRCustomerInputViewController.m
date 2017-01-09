//
//  SRCustomerInputViewController.m
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRCustomerInputViewController.h"
#import "SRCustomerInputViewController+Private.h"


@implementation SRCustomerInputViewController

- (IBAction)checkSubscriptionPressed:(id)sender {
    [self.rewardsService requestRewardsFromSubscriptions:self.subscriptions withCustomerID:self.customerIDTextField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSuscriptionTableView];
}


#pragma mark - Getters

- (SRRewardsService *)rewardsService {
    if (!_rewardsService) {
        _rewardsService = [SRRewardsService new];
        _rewardsService.delegate = self;
    }
    return _rewardsService;
}

- (NSArray <NSString*>*) subscriptions {
    
    NSMutableArray *subs;
    
    if ([[self.userDefaults objectForKey:SRAppKey] isKindOfClass:[NSDictionary class]]) {
        
        NSMutableDictionary *channels = [self.userDefaults objectForKey:SRAppKey];
        subs = [NSMutableArray new];
        for (NSString *key in channels) {
            if ( [[channels objectForKey:key] isKindOfClass:[NSString class]]) {
                NSString *isChannelSelected = [channels objectForKey:key];
                [isChannelSelected isEqualToString:SRChannelSelected] ? [subs addObject:key] : nil;
            }
        }
    }
    return subs;
}

- (NSUserDefaults *)userDefaults {
    return _userDefaults = _userDefaults ?: [NSUserDefaults standardUserDefaults];
}

#pragma mark - SRRewardsService Delegate

- (void)didLoadRewards:(NSArray *)rewards {
    NSString *titleWithRewards = NSLocalizedString(@"Awesome these are your rewards!", alert.rewards.title);
    NSString *titleNoRewards = NSLocalizedString(@"Sorry You have no rewards", alert.noRewards.title);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[rewards count] > 0 ? titleWithRewards : titleNoRewards
                                                                   message:[rewards componentsJoinedByString:@" " ]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[self okButtonWith:alert]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)didFailToLoadRewardsWithError:(NSString *)error {
    NSString *title = NSLocalizedString(@"Sorry there was an error!", alert.error.title);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:error
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[self okButtonWith:alert]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

#pragma mark - Private Helpers 

- (UIAlertAction *)okButtonWith:(UIAlertController *)alert {
    
    return [UIAlertAction
            actionWithTitle:NSLocalizedString(@"Dismiss", alert.dismiss)
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {
                [alert dismissViewControllerAnimated:YES completion:nil];
            }];
}

- (void)setupSuscriptionTableView {
    
    self.subscriptionsTableView.defaults = self.userDefaults;
    self.subscriptionsTableView.dataSource = self.subscriptionsTableView;
    self.subscriptionsTableView.delegate = self.subscriptionsTableView;
}

@end
