//
//  Helper.h
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 2/12/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Helper : NSObject

//resize image by width
+(UIImage*)resizeImageByWidth: (UIImage*) sourceImage width: (float) width;

//resize image by height
+(UIImage*)resizeImageByHeight: (UIImage*) sourceImage height: (float) height;

//resize image by width & height
+(UIImage*)resizeImage: (UIImage*) sourceImage width: (float) width height: (float) height;
@end
