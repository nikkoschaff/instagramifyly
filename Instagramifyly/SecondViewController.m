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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.isNewImage = YES;
}

<<<<<<< HEAD
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}


-(void)viewDidAppear:(BOOL)animated
{
    if (self.isNewImage)
    {
        CameraViewController *cameraVC = [[CameraViewController alloc] init];
        cameraVC.delegate = self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    self.isNewImage = YES;
}

- (void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image
{
    [self handleImage:image withNavigationController:cameraViewController.navigationController];
}

-(void)handleImage:(UIImage*)image withNavigationController:(UINavigationController*)nav
{
    if (image)
    {
        FilterViewController *filterVC = [[FilterViewController alloc] initWithImage:image];
        [nav pushViewController:filterVC animated:YES];
    }
    else
    {
        self.isNewImage = NO;
        [nav dismissViewControllerAnimated:YES completion:^() {
            NSString *storyboardName = @"Main";
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
            UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"tab_bar_controller"];
            [self presentViewController:vc animated:YES completion:nil];
        }];
    }
=======
-(void)viewDidAppear:(BOOL)animated
{
    if (self.isNewImage)
    {
        CameraViewController *cameraVC = [[CameraViewController alloc] init];
        cameraVC.delegate = self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cameraVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    self.isNewImage = YES;
}

- (void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *)image
{
    [self handleImage:image withNavigationController:cameraViewController.navigationController];
}

-(void)handleImage:(UIImage*)image withNavigationController:(UINavigationController*)nav
{
    if (image)
    {
        FilterViewController *filterVC = [[FilterViewController alloc] initWithImage:image];
        [nav pushViewController:filterVC animated:YES];
    }
    else
    {
        self.isNewImage = NO;
        [nav dismissViewControllerAnimated:YES completion:^() {
            NSString *storyboardName = @"Main";
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
            UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"tab_bar_controller"];
            [self presentViewController:vc animated:YES completion:nil];
        }];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
}


@end
