//
//  DevicesViewController.m
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "DevicesViewController.h"

#pragma mark Init

@interface DevicesViewController ()

+ (NSMutableArray *) initArray;

@end

@implementation DevicesViewController

@synthesize deviceTable;
@synthesize segmentDevices;

NSInteger popular = 0;
NSInteger common = 1;
NSInteger myDevices = 2;

#pragma mark View

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)goBack:(UIButton *)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.devicesArray = [DevicesViewController initArray];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark Devices Table

// returns the number of sections
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Set number of rows in the table view
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// Cell appearence
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    // change array based on segment view...
    
    NSMutableArray *currentDevices = [self devicesArray];
    
    // change string values based on the input 
    NSString *textLabel = currentDevices[[indexPath row]][@"device"];

    NSString *details = [NSString stringWithFormat:@"%@ x %@",
                         currentDevices[[indexPath row]][@"resH"],
                         currentDevices[[indexPath row]][@"resV"]];
    
    // set as constant font
    // cell.textLabel.font = [UIFont systemFontOfSize:11];
    // cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
    // set font dynamically rather than a set font
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    
    
    if (segmentDevices.selectedSegmentIndex == popular) {
        cell.textLabel.text = textLabel;
        cell.detailTextLabel.text = details;
        
    } else if (segmentDevices.selectedSegmentIndex == common) {
        cell.textLabel.text = [NSString stringWithFormat: @"Common %d", [indexPath row]];
        cell.detailTextLabel.text = @"1920x1080";
        
    } else if (segmentDevices.selectedSegmentIndex == myDevices) {
        cell.textLabel.text = [NSString stringWithFormat: @"MyDevice %d", [indexPath row]];
        cell.detailTextLabel.text = @"1920x1080";
        
    } else {
    cell.textLabel.text = [NSString stringWithFormat: @"Display %d", [indexPath row]];
    cell.detailTextLabel.text = @"1920x1080";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected Cell %d", [indexPath row]);
    
    // Return to the main page
}


- (IBAction)changedSegment:(UISegmentedControl *)sender {
    
    [deviceTable reloadData];
}

+ (NSMutableArray * ) initArray {
    
    NSString *devicesPath = [[NSBundle mainBundle] pathForResource:@"Devices" ofType:@"plist"];
    
    NSMutableArray *devices = [NSMutableArray arrayWithContentsOfFile:devicesPath];
    
    return devices;

}
@end
