//
//  Device.m
//  DPICalculator
//
//  Created by Matthew Faluotico on 9/30/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "Device.h"

@implementation Device

- (id)initWithName:(NSString *)n horizontalResolution:(NSInteger *)hr verticalResolution:(NSInteger *)vr  {
 
    self.deviceName = n;
    self.horizontalResolution = hr;
    self.verticalResolution = vr;
    
    return self;
}

-(NSString *) resolutionLine {
    
    return [NSString stringWithFormat:@"%i x %i", [self horizontalResolution], [self verticalResolution]];
}

@end
