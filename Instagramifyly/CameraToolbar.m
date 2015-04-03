//
//  CameraToolbar.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 4/3/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "CameraToolbar.h"

@implementation CameraToolbar

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.swapCameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.swapCameraButton addTarget:self action:@selector(swapCameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.swapCameraButton setImage:[UIImage imageNamed:@"flippy2"]  forState:UIControlStateNormal];
        
        self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cameraButton addTarget:self action:@selector(cameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.cameraButton setImage:[UIImage imageNamed:@"takephoto"] forState:UIControlStateNormal];
        
        self.photoLibraryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.photoLibraryButton addTarget:self action:@selector(photoLibraryButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.photoLibraryButton setImage:[UIImage imageNamed:@"camera"]  forState:UIControlStateNormal];
        
        self.background = [UIView new];
        self.background.backgroundColor = [UIColor blackColor];
        
        for (UIView *view in @[self.background, self.swapCameraButton, self.cameraButton, self.photoLibraryButton])
        {
            [self addSubview:view];
        }
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect blackgroundFrame = self.bounds;
    blackgroundFrame.origin.y += 10;
    self.background.frame = blackgroundFrame;
    
    CGFloat buttonWidth = CGRectGetWidth(self.bounds) / 3;
    
    NSArray *buttons = @[self.swapCameraButton, self.cameraButton, self.photoLibraryButton];
    for (int i = 0; i < 3; i++) {
        UIButton *button = buttons[i];
        button.frame = CGRectMake(i * buttonWidth, 10, buttonWidth, CGRectGetHeight(blackgroundFrame));
    }
}

-(void)swapCameraButtonPressed:(UIButton *)sender
{
    [self.delegate swapCameraButtonPressedOnToolbar:self];
}


-(void)cameraButtonPressed:(UIButton *)sender
{
    [self.delegate cameraButtonPressedOnToolbar:self];
}

- (void)photoLibraryButtonPressed:(UIButton *)sender
{
    [self.delegate photoLibraryButtonPressedOnToolbar:self];
}


@end
