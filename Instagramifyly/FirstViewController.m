//
//  FirstViewController.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/13/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import "FirstViewController.h"
#import "FilteredImage.h"
#import "PhotoTableViewCell.h"
<<<<<<< HEAD
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize photos;

<<<<<<< HEAD
- (void)viewDidLoad {
=======
-(void)viewDidLoad
{
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"PhotoRowCell"];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.photos = [NSMutableArray new];
    
    for (FilteredImage *fimage in FilteredImage.images)
    {
        [self.photos addObject:fimage];
    }
<<<<<<< HEAD
    
=======
        
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
    [self.tableView reloadData];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return photos.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoRowCell";
    
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = (PhotoTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    
    cell.caption.text = fimage.caption;
    cell.image = fimage.image;
    cell.backgroundView = [[UIImageView alloc] initWithImage:fimage.image];
    [cell setUserInteractionEnabled:NO];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    return 568;
}


=======
    return 568; 
}



>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
@end
