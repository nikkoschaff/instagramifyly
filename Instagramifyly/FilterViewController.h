//
//  FilterViewController.h
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/4/15.
=======
//  Created by Nikko Schaff on 2/7/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FilteredImage.h"

@interface FilterViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>

-(instancetype)initWithImage:(UIImage*)sourceImage;

@property (nonatomic, strong) UIImage *sourceImage;
@property (nonatomic, strong) UIImageView *previewImageView;

@property (nonatomic, strong) NSOperationQueue *photoFilterOperationQueue;
@property (nonatomic, strong) UICollectionView *filterCollectionView;

@property (nonatomic, strong) NSMutableArray *filterImages;
@property (nonatomic, strong) NSMutableArray *filterTitles;

@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIBarButtonItem *saveBarButton;

@property (nonatomic,strong) NSString *caption;

@end
