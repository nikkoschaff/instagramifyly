//
//  FilteredImage.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/7/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "FilteredImage.h"
#import "AssetsLibrary/AssetsLibrary.h"


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

        [library assetForURL:self.url
                 resultBlock:^(ALAsset *asset) {
                     ALAssetRepresentation *repr = [asset defaultRepresentation];
                     CGImageRef cgImg = [repr fullResolutionImage];
                     
                     UIImage *img = [UIImage imageWithCGImage:cgImg];
                     [NSThread detachNewThreadSelector:@selector(createImage:) toTarget:self withObject:img];
   
                     
                 } failureBlock:^(NSError *error) {
                     NSLog(@"Sorry - couldn't find image in memory");
        }];
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



@end
