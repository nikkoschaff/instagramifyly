//
//  SecondViewController.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/13/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ||
        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraPressed:)];
        self.navigationItem.rightBarButtonItem = cameraButton;
    }
    
    
    CameraViewController *cameraVC = [[CameraViewController alloc] init];
    cameraVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraVC];
    [self presentViewController:nav animated:YES completion:nil];
    
}

- (void) cameraPressed:(UIBarButtonItem *) sender {
    CameraViewController *cameraVC = [[CameraViewController alloc] init];
    cameraVC.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraVC];
    [self presentViewController:nav animated:YES completion:nil];
    return;
}

- (void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image {
    [cameraViewController dismissViewControllerAnimated:YES completion:^{
        if (image) {
            NSLog(@"Got an image!");
        } else {
            NSLog(@"Closed without an image.");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)takePhotoButtonPressed:(id)sender
{
    NSLog(@"take photo button pressed");
}

@end
