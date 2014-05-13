//
//  DPICViewController.m
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/11/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "DPICViewController.h"
#import <math.h>

@interface DPICViewController ()

@end


@implementation DPICViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    // updates every time the text changes
    [self.resHorizontal addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.resVertical addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.screenSize addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    self.resVertical.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.resVertical.layer.borderWidth = 1.0f;
    self.resVertical.layer.cornerRadius = 5;
    
    self.screenSize.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.screenSize.layer.borderWidth = 1.0f;
    self.screenSize.layer.cornerRadius = 5;
    
    self.resHorizontal.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.resHorizontal.layer.borderWidth = 1.0f;
    self.resHorizontal.layer.cornerRadius = 5;
    
//    self.buttonCopy.frame.size.width = 
    self.buttonCopy.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.buttonCopy.layer.borderWidth = 1.0f;
    self.buttonCopy.layer.cornerRadius = 27.5;
    [self.buttonCopy setTitle:@"Copy?" forState:UIControlStateHighlighted];
    
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // remember %g
}


// releases the keyboard when touching the view
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    [self updateResults];
}

// Linked to the touch did change in viewDidLoad
- (void) textFieldDidChange: (UITextField *) tf {
    
    
    [self updateResults];
}

- (double) getPPI {
    NSInteger vertical = [[[self resVertical] text] integerValue];
    NSInteger horizontal = [[[self resHorizontal] text] integerValue];
    double screen = [[[self screenSize] text] doubleValue];
    
    double area = vertical * (double)horizontal;
    double ratio = horizontal / (double)vertical;
    
    double v = sqrt(  (pow(screen,2)) / (pow(ratio, 2) + 1)  );
    double ppi = sqrt(area/  (v*v*ratio));
    
    return ppi;

}

// calculates ppi and displays it in the box
-(void) updateResults {
    
    NSInteger vertical = [[[self resVertical] text] integerValue];
    NSInteger horizontal = [[[self resHorizontal] text] integerValue];

    double ppi = [self getPPI];
    
    if (ppi == INFINITY || ppi == NAN || vertical == 0 || horizontal == 0)  {
        ppi = 0;
    }
    
    if (ppi != 0) {
        [[self resultsDPI ] setText:[NSString stringWithFormat:@"PPI: %g",ppi ]];
    } else {
        self.resultsDPI.text = @"...";
    }
        self.resultsScreen.text = [NSString stringWithFormat:@"Resolution: %li x %li", (long)horizontal,(long)vertical];
}

- (IBAction)quickResButton:(id)sender {
    
    NSString *hor = [[NSString alloc] init];
    NSString *vert = [[NSString alloc] init];
    
    NSString *b = ((UIButton * )sender).currentTitle;

    if ([b  isEqualToString: @"4K"]) {
        hor = @"3840";
        vert = @"2160";
    } else if ([b  isEqualToString: @"Full HD"]) {
        hor = @"1920";
        vert = @"1080";
    } else if ([b isEqualToString:@"HD"]) {
        hor = @"1280";
        vert = @"720";
    } else if ([b isEqualToString:@"QHD"]) {
        hor = @"2560";
        vert = @"1440";
    } else {
        hor = @"1920";
        vert = @"1080";
    }
    
    self.resHorizontal.text = hor;
    self.resVertical.text = vert;
    
    [self updateResults];
    
}

- (IBAction)copyPPI:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    
    double ppi = [self getPPI];
    
    pasteboard.string = [NSString stringWithFormat:@"%f", ppi];
}

@end

