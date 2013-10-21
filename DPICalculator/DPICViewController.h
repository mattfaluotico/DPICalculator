//
//  DPICViewController.h
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/11/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device.h"

@interface DPICViewController : UIViewController <UIAlertViewDelegate> {
    
};

@property (strong, nonatomic) IBOutlet UIButton *devices;
@property (strong, nonatomic) IBOutlet UITextField *resVertical;
@property (strong, nonatomic) IBOutlet UITextField *resHorizontal;
@property (strong, nonatomic) IBOutlet UITextField *screenSize;
@property (strong, nonatomic) IBOutlet UILabel *resultsDPI;
@property (strong, nonatomic) IBOutlet UILabel *resultsScreen;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

-(void) updateResults;

- (IBAction)addDevice:(UIButton *)sender;


@end
