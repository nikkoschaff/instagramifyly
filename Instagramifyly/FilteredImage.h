//
//  FilteredImage.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 2/7/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilteredImage : NSObject

@property NSString *caption;
@property NSURL *url;

+(NSMutableDictionary*)imagesDictionary;

-(instancetype) initWithCaption:(NSString*)caption andURL:(NSURL*)url;

@end
