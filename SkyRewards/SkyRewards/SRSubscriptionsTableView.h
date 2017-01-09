//
//  SRSubscriptionsTableView.h
//  SkyRewards
//
//  Created by Galloway, John (Associate Software Developer) on 07/01/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRSubscriptionsTableView : UITableView  <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSUserDefaults *defaults;

@end
