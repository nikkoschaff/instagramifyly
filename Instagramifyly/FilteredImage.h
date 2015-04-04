//
//  FilteredImage.h
//  Instagramifyly
//
//  Created by Nikko Schaff on 4/4/15.
//  Copyright (c) 2015 Nikko Mitrano Schaff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilteredImage : NSObject

@property NSString *caption;
@property NSURL *url;
@property UIImage *image;

+(NSMutableArray*)images;

-(instancetype)initWithCaption:(NSString*)caption andURL:(NSURL*)url;

@end
