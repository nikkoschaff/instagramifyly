//
//  ThirdViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/17/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) IBOutlet UILabel *numPostsLabel;
@property (weak,nonatomic) IBOutlet UITextView *textView;
@property (nonatomic,weak) IBOutlet UIImageView *profilePicture;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *editProfileButton;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *editTextButton;

@property (nonatomic,strong) NSMutableArray *photos;
@property (nonatomic,strong) UIImage *selectedProfilePicture;
@property (nonatomic) BOOL isUsingGridView;

-(IBAction)editProfileButtonClicked:(id)sender;
-(IBAction)editTextButtonClicked:(id)sender;
- (BOOL)startMediaBrowserFromViewController: (UIViewController*) controller
                              usingDelegate: (id <UIImagePickerControllerDelegate,
                                              UINavigationControllerDelegate>) delegate;

@end
