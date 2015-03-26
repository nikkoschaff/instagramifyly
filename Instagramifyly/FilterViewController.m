//
//  FilterViewController.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/7/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "FilterViewController.h"

#import "AssetsLibrary/AssetsLibrary.h"

@interface FilterViewController ()

@end

@implementation FilterViewController 

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.previewImageView];
    [self.view addSubview:self.filterCollectionView];
    
    if (CGRectGetHeight(self.view.frame) > 500)
    {
        [self.view addSubview:self.saveButton];
    } else
    {
        self.navigationItem.rightBarButtonItem = self.saveBarButton;
    }
    
    [self.filterCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.filterCollectionView.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"Apply Filter";
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
    {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else
    {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithImage:(UIImage *)sourceImage
{
    self = [super init];
    
    if (self)
    {
        self.sourceImage = sourceImage;
        self.previewImageView = [[UIImageView alloc] initWithImage:self.sourceImage];
        
        self.photoFilterOperationQueue = [[NSOperationQueue alloc] init];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(44, 64);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        
        self.filterCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        self.filterCollectionView.dataSource = self;
        self.filterCollectionView.delegate = self;
        self.filterCollectionView.showsHorizontalScrollIndicator = NO;
        
        self.filterImages = [NSMutableArray arrayWithObject:sourceImage];
        self.filterTitles = [NSMutableArray arrayWithObject:@"None"];
        
        self.saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.saveButton.backgroundColor = [UIColor blackColor];
        self.saveButton.layer.cornerRadius = 5;
        [self.saveButton setAttributedTitle:[self saveAttributedString] forState:UIControlStateNormal];
        [self.saveButton addTarget:self action:@selector(saveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.saveBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)];
        
        [self addFiltersToQueue];
    }
    
    return self;
}

-(NSAttributedString *)saveAttributedString
{
    NSString *baseString = @"Save Image";
    NSRange range = [baseString rangeOfString:baseString];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:baseString];
    
    [commentString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13] range:range];
    [commentString addAttribute:NSKernAttributeName value:@1.3 range:range];
    [commentString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range];
    
    return commentString;
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat edgeSize = MIN(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    self.previewImageView.frame = CGRectMake(0, self.topLayoutGuide.length, edgeSize, edgeSize);
    
    CGFloat buttonHeight = 50;
    CGFloat buffer = 10;
    
    CGFloat filterViewYOrigin = CGRectGetMaxY(self.previewImageView.frame) + buffer;
    CGFloat filterViewHeight;
    
    if (CGRectGetHeight(self.view.frame) > 500)
    {
        self.saveButton.frame = CGRectMake(buffer, CGRectGetHeight(self.view.frame) - buffer - buttonHeight, CGRectGetWidth(self.view.frame) - 2 * buffer, buttonHeight);
        
        filterViewHeight = CGRectGetHeight(self.view.frame) - filterViewYOrigin - buffer - buffer - CGRectGetHeight(self.saveButton.frame);
    } else
    {
        filterViewHeight = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(self.previewImageView.frame) - buffer - buffer;
    }
    
    self.filterCollectionView.frame = CGRectMake(0, filterViewYOrigin, CGRectGetWidth(self.view.frame), filterViewHeight);
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.filterCollectionView.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(CGRectGetHeight(self.filterCollectionView.frame) - 20, CGRectGetHeight(self.filterCollectionView.frame));
}

#pragma mark CollectionView

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.filterImages.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    static NSInteger imageViewTag = 1000;
    static NSInteger labelTag = 1001;
    
    UIImageView *thumbnail = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:labelTag];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.filterCollectionView.collectionViewLayout;
    CGFloat thumbnailEdgeSize = flowLayout.itemSize.width;
    
    if (!thumbnail)
    {
        thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, thumbnailEdgeSize, thumbnailEdgeSize)];
        thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        thumbnail.tag = imageViewTag;
        thumbnail.clipsToBounds = YES;
        
        [cell.contentView addSubview:thumbnail];
    }
    
    if (!label)
    {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, thumbnailEdgeSize, thumbnailEdgeSize, 20)];
        label.tag = labelTag;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];
        [cell.contentView addSubview:label];
    }
    
    thumbnail.image = self.filterImages[indexPath.row];
    label.text = self.filterTitles[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.previewImageView.image = self.filterImages[indexPath.row];
}

-(void)addFiltersToQueue
{
    CIImage *sourceCIImage = [CIImage imageWithCGImage:self.sourceImage.CGImage];
    
    [self.photoFilterOperationQueue addOperationWithBlock:^{
        CIFilter *noirFilter = [CIFilter filterWithName:@"CIPhotoEffectNoir"];
        if (noirFilter)
        {
            [noirFilter setValue:sourceCIImage forKey:kCIInputImageKey];
            [self addCIImageToCollectionView:noirFilter.outputImage withFilterTitle:@"Noir"];
        }
    }];
    
    [self.photoFilterOperationQueue addOperationWithBlock:^{
        CIFilter *vintageCoolFilter = [CIFilter filterWithName:@"CIPhotoEffectProcess"];
        if (vintageCoolFilter)
        {
            [vintageCoolFilter setValue:sourceCIImage forKey:kCIInputImageKey];
            [self addCIImageToCollectionView:vintageCoolFilter.outputImage withFilterTitle:@"Cool"];
        }
    }];
    
    [self.photoFilterOperationQueue addOperationWithBlock:^{
        CIFilter *vintageWarmFilter = [CIFilter filterWithName:@"CIPhotoEffectTransfer"];
        if (vintageWarmFilter)
        {
            [vintageWarmFilter setValue:sourceCIImage forKey:kCIInputImageKey];
            [self addCIImageToCollectionView:vintageWarmFilter.outputImage withFilterTitle:@"Warm"];
        }
    }];
    
    [self.photoFilterOperationQueue addOperationWithBlock:^{
        CIFilter *pixelFilter = [CIFilter filterWithName:@"CIPixellate"];
        if (pixelFilter)
        {
            [pixelFilter setValue:sourceCIImage forKey:kCIInputImageKey];
            [self addCIImageToCollectionView:pixelFilter.outputImage withFilterTitle:@"Pixel"];
        }
    }];
}

- (void) addCIImageToCollectionView:(CIImage *)CIImage withFilterTitle:(NSString *)filterTitle
{
    UIImage *image = [UIImage imageWithCIImage:CIImage scale:self.sourceImage.scale orientation:self.sourceImage.imageOrientation];
    
    if (image)
    {
        UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
        [image drawAtPoint:CGPointZero];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSUInteger newIndex = self.filterImages.count;
            
            [self.filterImages addObject:image];
            [self.filterTitles addObject:filterTitle];
            
            [self.filterCollectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:newIndex inSection:0]]];
        });
    }
}

#pragma mark Saving Image

-(void)saveButtonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Caption" message:@"Add a caption." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.placeholder = @"Caption";
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        
        self.caption = [alertView textFieldAtIndex:0].text;
        
        ALAssetsLibrary *library = [ALAssetsLibrary new];
        
        [library writeImageToSavedPhotosAlbum:[self.previewImageView.image CGImage] orientation:(ALAssetOrientation)[self.previewImageView.image imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error)
        {
            if (error)
            {
                NSLog(@"error");
            }
            else
            {
                
                FilteredImage *filteredImage = [[FilteredImage alloc] initWithCaption:self.caption andURL:assetURL];
                [FilteredImage.images addObject:filteredImage];
                
                NSString *storyboardName = @"Main";
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
                UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"tab_bar_controller"];
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    //Here your non-main thread.
                    [NSThread sleepForTimeInterval:0.5f];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //Here you returns to main thread.
                        [self presentViewController:vc animated:YES completion:nil];
                    });
                });
                
            }
        }];
        


    }
}




@end
