//
//  AVCaptureDevice+Resolution.m
//  ARAPP-OpenStandard
//
//  Created by Asa on 2019/6/28.
//  Copyright © 2019 Asa. All rights reserved.
//

#import "AVCaptureDevice+Resolution.h"

@implementation AVCaptureDevice (Resolution)

- (BOOL)isResolutionSupport:(CGSize)resolutionSize position:(AVCaptureDevicePosition) cameraPosition {
    CGSize maxSize = [self getCameraMaxResolutionPosition:cameraPosition];
    return !(maxSize.width < resolutionSize.width && maxSize.height < resolutionSize.height);
}

- (CGSize) getCameraMaxResolutionPosition:(AVCaptureDevicePosition) cameraPosition {
    CGSize resolution = CGSizeZero;
    CMVideoDimensions max_resolution;
    max_resolution.width = 0;
    max_resolution.height = 0;
    
    NSArray *availFormats = self.formats;
    
    for (AVCaptureDeviceFormat* format in availFormats) {
        CMVideoDimensions resolution = format.highResolutionStillImageDimensions;
        int w = resolution.width;
        int h = resolution.height;
        if ((w * h) > (max_resolution.width * max_resolution.height)) {
            max_resolution.width = w;
            max_resolution.height = h;
        }
    }
    resolution = CGSizeMake(max_resolution.width, max_resolution.height);
    return resolution;
}

@end
