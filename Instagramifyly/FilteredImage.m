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

+(NSMutableDictionary*)imagesDictionary
{
    static NSMutableDictionary *dictionary = nil;
    
    if (dictionary == nil)
    {
        dictionary = [NSMutableDictionary new];
    }
    
    return dictionary;
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
                     self.image = [UIImage imageWithCGImage:cgImg];
                 } failureBlock:^(NSError *error) {
                     NSLog(@"Sorry - couldn't find it");
        }];
    }
    return self;
}



@end
