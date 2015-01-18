//
//  CameraToolbar.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 1/18/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CameraToolbar;

@protocol CameraToolbarDelegate <NSObject>

- (void) leftButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void) rightButtonPressedOnToolbar:(CameraToolbar *)toolbar;
- (void) cameraButtonPressedOnToolbar:(CameraToolbar *)toolbar;

@end

@interface CameraToolbar : UIView

- (instancetype) initWithImageNames:(NSArray *)imageNames;

@property (nonatomic, weak) NSObject <CameraToolbarDelegate> *delegate;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *purpleView;


@end