//
//  SecondViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/13/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraViewController.h"
//#import "FilterViewController.h"

@interface SecondViewController : UIViewController <CameraViewControllerDelegate>

@property (nonatomic) BOOL isNewImage;

@end

