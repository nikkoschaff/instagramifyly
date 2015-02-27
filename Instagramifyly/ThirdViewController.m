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
@synthesize isUsingGridView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isUsingGridView = NO;
    [self.tableView setHidden:NO];
    [self.collectionView setHidden:YES];
    [self.tableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"PhotoRowCell"];
//    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellReuseIdentifier:@"PhotoCollectionCell"];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.photos = [NSMutableArray new];
    
    for (NSString *caption in FilteredImage.imagesDictionary)
    {
        FilteredImage *fimage = [FilteredImage.imagesDictionary objectForKey:caption];
        [self.photos addObject:fimage];
    }
    [self.tableView reloadData];
    [self.collectionView reloadData];
    [self.numPostsLabel setText:[NSString stringWithFormat:@"%lu",(unsigned long)FilteredImage.imagesDictionary.count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return photos.count;
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 568;
}

- (BOOL)startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = delegate;
    
    [controller presentViewController:mediaUI animated:YES completion:^{
        //TODO
    }];
    return YES;
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

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CollectionCellIdentifier = @"PhotoCollectionCell";
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [PhotoCollectionViewCell new];
    }
    
    FilteredImage *fimage = [photos objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [UIColor whiteColor];
    [cell.imageView removeFromSuperview];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.frame];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.clipsToBounds = YES;
    [imageView setUserInteractionEnabled:NO];
    //imageView.tag = indexPath.row;
    [imageView setImage:fimage.image];
    
    [cell addSubview:imageView];
    [cell setUserInteractionEnabled:NO];
    return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(150, 150);
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
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

-(IBAction)editProfileButtonClicked:(id)sender
{
    [self startMediaBrowserFromViewController:self usingDelegate:self];
}

-(IBAction)editTextButtonClicked:(id)sender
{
    if ([self.editTextButton.title isEqualToString:@"Edit Description"]) {
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
    self.isUsingGridView = YES;
    [self.tableView setHidden:YES];
    [self.collectionView setHidden:NO];
}


-(IBAction)listButtonClicked:(id)sender
{
    NSLog(@"List button clicked");
    self.isUsingGridView = NO;
    [self.tableView setHidden:NO];
    [self.collectionView setHidden:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
