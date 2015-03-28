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
-(void)swapCameraButtonPressedOnToolbar:(CameraToolbar *)toolbar;
-(void)cameraButtonPressedOnToolbar:(CameraToolbar *)toolbar;
-(void)photoLibraryButtonPressedOnToolbar:(CameraToolbar *)toolbar;
@end

@interface CameraToolbar : UIView

-(instancetype)init;

@property (nonatomic, weak) NSObject <CameraToolbarDelegate> *delegate;

@property (nonatomic, strong) UIButton *swapCameraButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *photoLibraryButton;

@property (nonatomic, strong) UIView *blackround;

@end