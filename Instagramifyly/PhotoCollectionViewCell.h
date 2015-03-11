//
//  PhotoCollectionViewCell.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/27/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilteredImage.h"

@class FilteredImage;
@interface PhotoCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) FilteredImage *fimage;
@end
