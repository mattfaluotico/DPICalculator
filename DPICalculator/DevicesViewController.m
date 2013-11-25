//
//  DevicesViewController.m
//  DPICalculator
//
//  Created by Matthew Faluotico on 8/12/13.
//  Copyright (c) 2013 Matthew Faluotico. All rights reserved.
//

#import "DevicesViewController.h"
#import "DPICViewController.h"

#pragma mark Init


@interface DevicesViewController ()

+ (NSMutableArray *) initArrayBySeg:(int)seg;

@end

#pragma mark implementation

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

-(void)viewDidAppear:(BOOL)animated {
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activeDeviceArray = [DevicesViewController initArrayBySeg:[segmentDevices selectedSegmentIndex]];
	
    // Do any additional setup after loading the view.
    //self.devicesArray = [DevicesViewController initArray];

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
    
    // change string values based on the input 
    NSString *textLabel = [self activeDeviceArray][[indexPath row]][@"device"];

    NSString *details = [NSString stringWithFormat:@"%@ x %@",
                         [self activeDeviceArray][[indexPath row]][@"resH"],
                         [self activeDeviceArray][[indexPath row]][@"resV"]];
    
    // set as constant font
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    
    if (textLabel != nil && details != nil) {
        cell.textLabel.text = textLabel;
        cell.detailTextLabel.text = details;
        
    } else {
        cell.textLabel.text = [NSString stringWithFormat: @"Display %d", [indexPath row]];
        cell.detailTextLabel.text = @"1920x1080";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected Cell %d", [indexPath row]);
    
    // TODO: Create object from plist index
	
   // [[NSNotificationCenter defaultCenter] postNotificationName:@"device" object:newD];
}


- (IBAction)changedSegment:(UISegmentedControl *)sender {
    
    self.activeDeviceArray  = [DevicesViewController initArrayBySeg:sender.selectedSegmentIndex];
    [deviceTable reloadData];
}

+ (NSMutableArray * ) initArrayBySeg: (int) seg {
    
    
    NSString *path;
    if (seg == myDevices) {
        path = @"My Devices";
    } else if (seg == common) {
        path = @"Common";
    } else { // popular
        path = @"Devices";
    }
    
    NSString *devicesPath = [[NSBundle mainBundle] pathForResource:path ofType:@"plist"];
    NSMutableArray *devicesDB = [NSMutableArray arrayWithContentsOfFile:devicesPath];
    
    return devicesDB;

}


@end
