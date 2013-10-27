//
//  DevicesViewController.h
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevicesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentDevices;
@property (strong, nonatomic) IBOutlet UITableView *deviceTable;
@property (strong, nonatomic) NSMutableArray *devicesArray;


- (IBAction)changedSegment:(UISegmentedControl *)sender;
@end
