//
//  Device.h
//  DPICalculator
//
//  Created by Matthew Faluotico on 9/30/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property NSString *deviceName;
@property NSInteger *horizontalResolution;
@property NSInteger *verticalResolution;

-(id)initWithName: (NSString *) n horizontalResolution: (NSInteger) hr verticalResolution: (NSInteger) vr;

- (NSString *) resolutionLine;

@end