//
//  ThirdViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/17/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *photos;

@property (nonatomic,weak) IBOutlet UIImageView *profilePicture;

@end
