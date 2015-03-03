//
//  PhotoCollectionViewCell.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/27/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "PhotoCollectionViewCell.h"


@implementation PhotoCollectionViewCell

@synthesize fimage;
@synthesize imageView;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imageView = [UIImageView new];
        self.imageView.frame = self.bounds;
        [self addSubview:self.imageView];
    }
    return self;
}


@end
