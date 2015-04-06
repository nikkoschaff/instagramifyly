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
<<<<<<< HEAD
=======
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *navTitle;

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
@property (nonatomic,strong) NSMutableArray *photos;

@end

