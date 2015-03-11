//
//  PhotoCollectionViewCell.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/27/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "FilteredImage.h"


@implementation PhotoCollectionViewCell

@synthesize fimage;
@synthesize imageView;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.contentView addSubview:self.imageView];
        self.imageView.tag = 5000;
    }
    return self;
}

-(void)setPhoto:(FilteredImage*)image
{
    if(self.fimage != image)
    {
        self.fimage = image;
    }
    self.imageView.image = self.fimage.image;
}

@end
