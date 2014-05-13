//
//  ResolutionButton.m
//  DPICalculator
//
//  Created by Matthew Faluotico on 5/13/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

#import "ResolutionButton.h"

@implementation ResolutionButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.layer.cornerRadius = 5;
    
    }
    return self;
}


@end
