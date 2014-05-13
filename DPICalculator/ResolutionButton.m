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
        [self buildButton];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self) {
        [self buildButton];
    
    }
    return self;
}

//Button setup
- (void) buildButton {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.cornerRadius = 5;
}

- (void) set {
    
    NSString *ns = self.titleLabel.text;
    [self setTitle:@"Set" forState:UIControlStateNormal];
    [self performSelector:@selector(returnToNormalState:)
               withObject:(NSObject *)ns
               afterDelay:1.0f];
    
}

- (void) returnToNormalState: (NSString *) normalState{

    [self setTitle: (NSString *)normalState forState:UIControlStateNormal];
    self.titleLabel.text = normalState;
}

@end
