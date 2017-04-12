//
//  Helper.m
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 2/12/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "Helper.h"

@implementation Helper

//resize image by width
+(UIImage*)resizeImageByWidth: (UIImage*) sourceImage width: (float) width
{
    //get current width to set the scale factor
    float oldWidth = sourceImage.size.width;
    float scaleFactor = width / oldWidth;
    
    //set new hight and width using the scaling factor of image
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    return [self resizeImage:sourceImage width:newWidth height:newHeight];
}

//resize image by height
+(UIImage*)resizeImageByHeight: (UIImage*) sourceImage height: (float) height
{
    //get current height to set the scale factor
    float oldHeight = sourceImage.size.height;
    float scaleFactor = height / oldHeight;
    
    float newHeight = oldHeight * scaleFactor;
    float newWidth = sourceImage.size.width * scaleFactor;
    
    return [self resizeImage:sourceImage width:newWidth height:newHeight];
}

//resize image by width & height
+(UIImage*)resizeImage: (UIImage*) sourceImage width: (float) width height: (float) height
{
    //Set image frame using given width and height
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0, 0, width, height)];
    
    //set the new image with size
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //save & return new image
    UIGraphicsEndImageContext();
    return newImage;
}

@end
