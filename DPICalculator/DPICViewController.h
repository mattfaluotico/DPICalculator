//
//  DPICViewController.h
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/11/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResolutionButton.h"

@interface DPICViewController : UIViewController <UIAlertViewDelegate> {
    
};

@property (strong, nonatomic) IBOutlet UITextField *resVertical;
@property (strong, nonatomic) IBOutlet UITextField *resHorizontal;
@property (strong, nonatomic) IBOutlet UITextField *screenSize;
@property (strong, nonatomic) IBOutlet UILabel *resultsDPI;
@property (strong, nonatomic) IBOutlet UILabel *resultsScreen;
@property (weak, nonatomic) IBOutlet UIButton *buttonCopy;

-(void) updateResults;

- (IBAction)quickResButton:(id)sender;

- (IBAction)copyPPI:(id)sender;

- (IBAction)copyChangeText:(id)sender;

@end
