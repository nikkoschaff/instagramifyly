//
//  CameraToolbar.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 1/18/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "CameraToolbar.h"

@implementation CameraToolbar


- (instancetype) initWithImageNames:(NSArray *)imageNames {
    self = [super init];
    
    if (self) {
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.leftButton addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.cameraButton addTarget:self action:@selector(cameraButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.leftButton setImage:[UIImage imageNamed:imageNames.firstObject] forState:UIControlStateNormal];
        
        [self.rightButton setImage:[UIImage imageNamed:imageNames.lastObject] forState:UIControlStateNormal];
        
        [self.cameraButton setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
        
        self.whiteView = [UIView new];
        self.whiteView.backgroundColor = [UIColor whiteColor];
        
        
        for (UIView *view in @[self.whiteView, self.leftButton, self.cameraButton, self.rightButton]) {
            [self addSubview:view];
        }
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    CGRect whiteFrame = self.bounds;
    whiteFrame.origin.y += 10;
    self.whiteView.frame = whiteFrame;
    
    CGFloat buttonWidth = CGRectGetWidth(self.bounds) / 3;
    
    NSArray *buttons = @[self.leftButton, self.cameraButton, self.rightButton];
    for (int i = 0; i < 3; i++) {
        UIButton *button = buttons[i];
        button.frame = CGRectMake(i * buttonWidth, 10, buttonWidth, CGRectGetHeight(whiteFrame));
    }
}

- (void) leftButtonPressed:(UIButton *)sender {
    [self.delegate leftButtonPressedOnToolbar:self];
}

- (void) rightButtonPressed:(UIButton *)sender {
    [self.delegate rightButtonPressedOnToolbar:self];
}

- (void) cameraButtonPressed:(UIButton *)sender {
    [self.delegate cameraButtonPressedOnToolbar:self];
}

@end
