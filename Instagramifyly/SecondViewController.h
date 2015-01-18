//
//  SecondViewController.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/13/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraViewController.h"

@interface SecondViewController : UIViewController <CameraViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;

-(IBAction)takePhotoButtonPressed:(id)sender;

@end

