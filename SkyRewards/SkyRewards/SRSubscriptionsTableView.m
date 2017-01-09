//
//  SRSubscriptionsTableView.m
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import "SRSubscriptionsTableView.h"

//Model
#import "SRDefaultsUtils.h"

@implementation SRSubscriptionsTableView

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[[self.defaults objectForKey:SRAppKey] allKeys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"SRSubscriptionTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [[[self.defaults objectForKey:SRAppKey] allKeys] objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [self backgroundColourFromIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedChannel = [[[self.defaults objectForKey:SRAppKey] allKeys] objectAtIndex:indexPath.row];
    NSString *selectedChannelStatus = [[self.defaults objectForKey:SRAppKey] objectForKey:selectedChannel];
    
    [SRDefaultsUtils updateDefaultsWith:selectedChannel selected:[selectedChannelStatus isEqualToString:SRChannelUnselected] withCompletionHandler:^ {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = [self backgroundColourFromIndexPath:indexPath];
    }];
}

#pragma mark - Private Helper

- (UIColor *)backgroundColourFromIndexPath:(NSIndexPath *)indexPath {
    
    NSString *channel = [[[self.defaults objectForKey:SRAppKey] allKeys] objectAtIndex:indexPath.row];
    NSString *selectedStatus = [[self.defaults objectForKey:SRAppKey] objectForKey:channel];
    
    if ([selectedStatus isEqualToString:SRChannelSelected]) {
        return [UIColor lightGrayColor];
    } else {
        return [UIColor whiteColor];
    }
}

@end
