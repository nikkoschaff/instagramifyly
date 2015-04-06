//
//  PhotoCollectionViewCell.h
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/4/15.
=======
//  Created by Nikko Schaff on 2/27/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilteredImage.h"

@class FilteredImage;
@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) FilteredImage *fimage;
@end
