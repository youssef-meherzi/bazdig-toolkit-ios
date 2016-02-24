//
//  BZFormScrollViewViewController.m
//  bazdig-toolkit-ios
//
//  Created by Youssef Meherzi on 22/02/2016.
//  Copyright © 2016 Youssef Meherzi. All rights reserved.
//

#import "BZFormScrollViewViewController.h"

@interface BZFormScrollViewViewController()

@property (weak, nonatomic) IBOutlet UITextField *firstnameField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameField;
@property (weak, nonatomic) IBOutlet UITextField *streetField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextView *additionalField;

@end

@implementation BZFormScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.additionalField.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    self.additionalField.layer.borderWidth = 0.5;
    self.additionalField.layer.cornerRadius = 5;
}

- (IBAction)next:(id)sender {
    UIView *next;
    if (sender == self.firstnameField) {
        next = self.lastnameField;
    } else if (sender == self.lastnameField) {
        next = self.streetField;
    } else if (sender == self.streetField) {
        next = self.cityField;
    } else if (sender == self.cityField) {
        next = self.zipcodeField;
    } else if (sender == self.zipcodeField) {
        next = self.countryField;
    } else if (sender == self.countryField) {
        next = self.additionalField;
    }
    
    if (next) {
        [next becomeFirstResponder];
    }
}

- (IBAction)send {
    [[[UIAlertView alloc] initWithTitle:@"Really ??"
                                message:nil
                               delegate:nil
                      cancelButtonTitle:@"Forget it!"
                      otherButtonTitles:nil] show];
}

@end
