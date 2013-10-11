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
	
    // updates every time the text changes
    [self.resHorizontal addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.resVertical addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.screenSize addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // remember %g
}

// releases the keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void) textFieldDidChange: (UITextField *) tf {
    [self updateResults];
}

// calculates ppi and displays it in the box
-(void) updateResults {
    
    NSInteger vertical = [[[self resVertical] text] integerValue];
    NSInteger horizontal = [[[self resHorizontal] text] integerValue];
    double screen = [[[self screenSize] text] doubleValue];

    double area = vertical * (double)horizontal;
    double ratio = horizontal / (double)vertical;
        
    double v = sqrt(  (pow(screen,2)) / (pow(ratio, 2) + 1)  );
    double ppi = sqrt(area/  (v*v*ratio));
    
    if (ppi == INFINITY || ppi == NAN)  {
        ppi = 0;
    }
    
    if (ppi != 0) {
        [[self resultsDPI ] setText:[NSString stringWithFormat:@"PPI: %g",ppi ]];
    } else {
    self.resultsDPI.text = @"--";
    }
    self.resultsScreen.text = [NSString stringWithFormat:@"Resolution: %i x %i", horizontal,vertical];
    
    
    
}


// the plus button to add a device
- (IBAction)addDevice:(UIButton *)sender {
    
    UIAlertView *getName =[[UIAlertView alloc] initWithTitle:@"What is the device name?" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    
    [getName setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [getName show];
    
}

// when the alert is clicked a device is created and sent to the local database. 
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    // because the cancel button is index 0
    if (buttonIndex != 0) {
        NSInteger *hr = (NSInteger *)[[[self resHorizontal] text] integerValue];
        NSInteger *vr = (NSInteger *)[[[self resVertical] text] integerValue];
        
        NSString *name = [alertView textFieldAtIndex:0].text;
        
        // create a device object
        // TODO: make it weak ?
        Device *newD = [[Device alloc] initWithName:name horizontalResolution:hr verticalResolution:vr];
        
        // add device to the table
        
    }
    
    // Don't do anything if the cancle button is pressed
}

@end

