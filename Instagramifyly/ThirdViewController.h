//
//  ThirdViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/17/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak,nonatomic) IBOutlet UILabel *numPostsLabel;
@property (weak,nonatomic) IBOutlet UITextView *textView;
@property (nonatomic,weak) IBOutlet UIImageView *profilePicture;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *editProfileButton;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *editTextButton;
@property (nonatomic,weak) IBOutlet UIButton *gridButton;
@property (nonatomic,weak) IBOutlet UIButton *listButton;

@property (nonatomic,strong) NSMutableArray *photos;
@property (nonatomic,strong) UIImage *selectedProfilePicture;

-(IBAction)editProfileButtonClicked:(id)sender;
-(IBAction)editTextButtonClicked:(id)sender;
-(IBAction)gridButtonClicked:(id)sender;
-(IBAction)listButtonClicked:(id)sender;
- (BOOL)startMediaBrowserFromViewController: (UIViewController*) controller
                              usingDelegate: (id <UIImagePickerControllerDelegate,
                                              UINavigationControllerDelegate>) delegate;

@end
