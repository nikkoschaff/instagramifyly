//
//  FirstViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/13/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *photos;

@end

