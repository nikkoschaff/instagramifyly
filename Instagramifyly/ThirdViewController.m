//
//  ThirdViewController.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 12/17/14.
//  Copyright (c) 2014 Nikko Mitrano Schaff. All rights reserved.
//

#import "ThirdViewController.h"
#import "FilteredImage.h"
#import "AssetsLibrary/AssetsLibrary.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"Profile: %@",FilteredImage.imagesDictionary);
    
    
    if (FilteredImage.imagesDictionary.count > 0)
    {
        NSString *caption = FilteredImage.imagesDictionary.allKeys.firstObject;
        FilteredImage *fimage = [FilteredImage.imagesDictionary objectForKey:caption];
        self.profilePicture.image = fimage.image;

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
