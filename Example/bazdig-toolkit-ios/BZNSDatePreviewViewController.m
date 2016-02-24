//
//  BZNSDatePreviewViewController.m
//  bazdig-toolkit-ios
//
//  Created by Youssef Meherzi on 24/02/2016.
//  Copyright © 2016 Youssef Meherzi. All rights reserved.
//

#import "BZNSDatePreviewViewController.h"
#import "NSDate+preview.h"

@interface BZNSDatePreviewViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BZNSDatePreviewViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self dateChanged];
}

- (IBAction)dateChanged {
    self.dateLabel.text = [self.datePicker.date bz_previewWithTime:YES];
}

@end
