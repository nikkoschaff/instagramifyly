//
//  PhotoTableViewCell.m
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/4/15.
=======
//  Created by Nikko Schaff on 2/21/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "PhotoTableViewCell.h"

@implementation PhotoTableViewCell

-(void)awakeFromNib
{
    // Initialization code
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
<<<<<<< HEAD
    
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        // Helpers
        CGSize size = self.contentView.frame.size;
        // Initialize Main Label
        self.caption = [[UILabel alloc] initWithFrame:CGRectMake(8.0, 8.0, size.width - 16.0, size.height - 16.0)];
        
        // Configure Main Label
        [self.caption setFont:[UIFont boldSystemFontOfSize:24.0]];
        [self.caption setTextAlignment:NSTextAlignmentCenter];
        [self.caption setTextColor:[UIColor orangeColor]];
        [self.caption setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
<<<<<<< HEAD
        
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
        // Add Main Label to Content View
        [self.contentView addSubview:self.caption];
        self.imageView.image = self.image;
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}

@end
