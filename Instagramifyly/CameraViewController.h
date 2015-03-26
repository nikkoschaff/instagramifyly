//
//  CameraViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 1/18/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import "CameraToolbar.h"

@class CameraViewController;

@protocol CameraViewControllerDelegate <NSObject>
-(void)cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;
@end

@interface CameraViewController : UIViewController <CameraToolbarDelegate, UIAlertViewDelegate>

@property (nonatomic, weak) NSObject <CameraViewControllerDelegate> *delegate;

@property (nonatomic, strong) UIView *imagePreview;

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@property (nonatomic, strong) CameraToolbar *cameraToolbar;

@end