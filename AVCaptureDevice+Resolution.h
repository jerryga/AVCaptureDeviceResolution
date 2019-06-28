//
//  AVCaptureDevice+Resolution.h
//  ARAPP-OpenStandard
//
//  Created by baidu on 2019/6/28.
//  Copyright © 2019 Asa. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AVCaptureDevice (Resolution)

- (BOOL)isResolutionSupport:(CGSize)resolutionSize position:(AVCaptureDevicePosition) cameraPosition;

@end

NS_ASSUME_NONNULL_END
