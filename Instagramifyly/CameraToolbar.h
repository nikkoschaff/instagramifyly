//
//  CameraToolbar.h
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/3/15.
=======
//  Created by Nikko Schaff on 1/18/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
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

<<<<<<< HEAD
@property (nonatomic, strong) UIView *background;
=======
@property (nonatomic, strong) UIView *blackround;
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9

@end