//
//  FilteredImage.h
//  Instagramifyly
//
<<<<<<< HEAD
//  Created by Nikko Schaff on 4/4/15.
=======
//  Created by Nikko Schaff on 2/7/15.
>>>>>>> 79fff52daf4e8d7b10ad0e3f405adcf863834bc9
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
