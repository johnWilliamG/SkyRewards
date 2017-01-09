//
//  SRRewardsService.m
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRRewardsService.h"

NSString * const kRewardsApiUrl = @"http://127.0.0.1:4000";
NSString * const kRewardsApiHTTPMethod = @"GET";
NSString * const kResponseRewardskey = @"Rewards";
NSString * const kCustomerIDHeaderField = @"CustomerID";
NSString * const kSubscriptionsHeaderField = @"Subscritpions";

@implementation SRRewardsService

- (void)requestRewardsFromSubscriptions:(NSArray<NSString *> *)subscriptions withCustomerID:(NSString *)customerID {
    
    if ([customerID length] == 0) {
        [self.delegate didFailToLoadRewardsWithError:NSLocalizedString(@"There is no Customer ID",alert.error.noCustomerID)];
        return;
    }
    
    //Setup Config For Session
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kRewardsApiUrl]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    request.HTTPMethod = kRewardsApiHTTPMethod;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    //Add Customer ID and Subscriptions To Request
    [request addValue:customerID forHTTPHeaderField:kCustomerIDHeaderField];
    [request addValue:[subscriptions componentsJoinedByString:@","] forHTTPHeaderField:kSubscriptionsHeaderField];

    //Data Task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    
        if (error) {
            [self.delegate didFailToLoadRewardsWithError:[error localizedDescription]];
        } else {
    
            NSDictionary *jsonDicitonary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            [self.delegate didLoadRewards:[jsonDicitonary objectForKey:kResponseRewardskey]];
        }
    }];
    
    [task resume];
}

@end

