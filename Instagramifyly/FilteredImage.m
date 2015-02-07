//
//  FilteredImage.m
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/7/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import "FilteredImage.h"

@implementation FilteredImage

@synthesize caption;
@synthesize url;

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
    }
    return self;
}



@end
