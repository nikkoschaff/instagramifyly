//
//  ThirdViewController.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/17/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import "ThirdViewController.h"
#import "FilteredImage.h"
#import "PhotoTableViewCell.h"
#import "PhotoCollectionViewCell.h"

@interface ThirdViewController ()
@end

@implementation ThirdViewController

@synthesize selectedProfilePicture;
@synthesize photos;

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.photos = [NSMutableArray new];
    [self.tableView setHidden:YES];
    [self.collectionView setHidden:NO];
    [self.tableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"PhotoRowCell"];
    [self.collectionView setBounces:YES];
    [self.collectionView setAlwaysBounceVertical:YES];
<<<<<<< HEAD
    
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
    self.collectionView.bounces = YES;
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    [self.collectionView setShowsVerticalScrollIndicator:NO];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.photos = [NSMutableArray new];
    
    for (FilteredImage *fimage in FilteredImage.images)
    {
        [self.photos addObject:fimage];
    }
    [self.tableView reloadData];
    [self.collectionView reloadData];
    [self.numPostsLabel setText:[NSString stringWithFormat:@"%lu",(unsigned long)FilteredImage.images.count]];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return photos.count;
<<<<<<< HEAD
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoRowCell";
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = (PhotoTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.caption setText:fimage.caption];
    cell.image = fimage.image;
    cell.backgroundView = [[UIImageView alloc] initWithImage:fimage.image];
    [cell setUserInteractionEnabled:NO];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 568;
}


#pragma mark CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(PhotoCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CollectionCellIdentifier = @"PhotoCollectionCell";
    
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [PhotoCollectionViewCell new];
    }
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor blueColor];
    cell.backgroundView = [[UIImageView alloc] initWithImage:fimage.image];
    
    [cell setUserInteractionEnabled:NO];
    return cell;
}

#pragma mark – UICollectionViewDelegate

=======
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PhotoRowCell";
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = (PhotoTableViewCell*)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.caption setText:fimage.caption];
    cell.image = fimage.image;
    cell.backgroundView = [[UIImageView alloc] initWithImage:fimage.image];
    [cell setUserInteractionEnabled:NO];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 568;
}


#pragma mark CollectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(PhotoCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CollectionCellIdentifier = @"PhotoCollectionCell";
    
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [PhotoCollectionViewCell new];
    }
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor blueColor];
    cell.backgroundView = [[UIImageView alloc] initWithImage:fimage.image];
    
    [cell setUserInteractionEnabled:NO];
    return cell;
}

#pragma mark – UICollectionViewDelegate

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155,155);
}

-(CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark General Interaction

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    FilteredImage *selectedFilteredImage = [[FilteredImage alloc] initWithCaption:@"Profile Pic" andURL:[info objectForKey:@"UIImagePickerControllerReferenceURL"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //Here your non-main thread.
        [NSThread sleepForTimeInterval:0.5f];
        dispatch_async(dispatch_get_main_queue(), ^{
            //Here you returns to main thread.
            self.selectedProfilePicture = selectedFilteredImage.image;
            [self.profilePicture setImage:self.selectedProfilePicture];
            [picker dismissViewControllerAnimated:YES completion:^{
            }];
            
        });
    });
}

-(BOOL)startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id<UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate
{
    
    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = delegate;
    
    [controller presentViewController:mediaUI animated:YES completion:^{
        self.profilePicture.layer.backgroundColor=[[UIColor clearColor] CGColor];
        self.profilePicture.layer.cornerRadius=40;
        self.profilePicture.layer.borderWidth=1.0;
        self.profilePicture.layer.masksToBounds = YES;
        self.profilePicture.layer.borderColor=[[UIColor blackColor] CGColor];
    }];
    return YES;
<<<<<<< HEAD
}

-(IBAction)editProfileButtonClicked:(id)sender
{
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(IBAction)editTextButtonClicked:(id)sender
{
    if ([self.editTextButton.title isEqualToString:@"Set Bio"])
    {
        [self.textView becomeFirstResponder];
    }
    else
    {
        [self.editTextButton setTitle:@"Set Bio"];
        [self.textView endEditing:YES];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.editTextButton setTitle:@"Save"];
}

-(IBAction)gridButtonClicked:(id)sender
{
    NSLog(@"Grid button clicked");
    [self.tableView setHidden:YES];
    [self.collectionView setHidden:NO];
}


-(IBAction)listButtonClicked:(id)sender
{
    NSLog(@"List button clicked");
    [self.tableView setHidden:NO];
    [self.collectionView setHidden:YES];
}
=======
}

-(IBAction)editProfileButtonClicked:(id)sender
{
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(IBAction)editTextButtonClicked:(id)sender
{
    if ([self.editTextButton.title isEqualToString:@"Edit Description"])
    {
        [self.textView becomeFirstResponder];
    }
    else
    {
        [self.editTextButton setTitle:@"Edit Description"];
        [self.textView endEditing:YES];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.editTextButton setTitle:@"Save"];
}

-(IBAction)gridButtonClicked:(id)sender
{
    NSLog(@"Grid button clicked");
    [self.tableView setHidden:YES];
    [self.collectionView setHidden:NO];
}


-(IBAction)listButtonClicked:(id)sender
{
    NSLog(@"List button clicked");
    [self.tableView setHidden:NO];
    [self.collectionView setHidden:YES];
}

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9

@end
