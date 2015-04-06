//
//  FilteredImage.m
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/4/15.
=======
//  Created by Nikko Schaff on 2/7/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "FilteredImage.h"
#import "AssetsLibrary/AssetsLibrary.h"

<<<<<<< HEAD
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
@implementation FilteredImage

@synthesize caption;
@synthesize url;
@synthesize image;

+(NSMutableArray*)images
{
    static NSMutableArray *array = nil;
    
    if (array == nil)
    {
        array = [NSMutableArray new];
    }
    
    return array;
}

-(instancetype) initWithCaption:(NSString*)theCaption andURL:(NSURL*)theUrl
{
    self = [super init];
    
    if (self)
    {
        self.caption = theCaption;
        self.url = theUrl;
        ALAssetsLibrary *library = [ALAssetsLibrary new];
<<<<<<< HEAD
        
=======

>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
        [library assetForURL:self.url
                 resultBlock:^(ALAsset *asset) {
                     ALAssetRepresentation *repr = [asset defaultRepresentation];
                     CGImageRef cgImg = [repr fullResolutionImage];
                     
                     UIImage *img = [UIImage imageWithCGImage:cgImg];
                     [NSThread detachNewThreadSelector:@selector(createImage:) toTarget:self withObject:img];
<<<<<<< HEAD
                     
                     
                 } failureBlock:^(NSError *error) {
                     NSLog(@"Sorry - couldn't find image in memory");
                 }];
=======
   
                     
                 } failureBlock:^(NSError *error) {
                     NSLog(@"Sorry - couldn't find image in memory");
        }];
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
    }
    return self;
}

-(void)createImage:(UIImage*)img
{
    CGSize newSize = CGSizeMake(320, 480);
    UIGraphicsBeginImageContext(newSize);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    self.image = newImage;
    UIGraphicsEndImageContext();
}



<<<<<<< HEAD
@end
=======
@end
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
