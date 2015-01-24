//
//  CameraViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 1/18/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
#import "UIImage+ImageUtilities.h"
#import "CameraToolbar.h"

@class GridCameraViewController;

@protocol GridCameraViewControllerDelegate <NSObject>

- (void) gridcameraViewController:(GridCameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image;

@end

@interface GridCameraViewController : UIViewController <CameraToolbarDelegate, UIAlertViewDelegate>

@property (nonatomic, weak) NSObject <GridCameraViewControllerDelegate> *delegate;

@property (nonatomic, strong) UIView *imagePreview;

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@property (nonatomic, strong) NSArray *horizontalLines;
@property (nonatomic, strong) NSArray *verticalLines;
@property (nonatomic, strong) UIToolbar *topView;
@property (nonatomic, strong) UIToolbar *bottomView;

@property (nonatomic, strong) CameraToolbar *cameraToolbar;

@end