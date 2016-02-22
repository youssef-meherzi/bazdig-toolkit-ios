//
//  BZFormScrollViewSubclassViewController.m
//  bazdig-toolkit-ios
//
//  Created by Youssef Meherzi on 22/02/2016.
//  Copyright © 2016 Youssef Meherzi. All rights reserved.
//

#import "BZFormScrollViewSubclassViewController.h"

@interface BZFormScrollViewSubclassViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstnameField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameField;
@property (weak, nonatomic) IBOutlet UITextField *streetField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextView *additionalField;

@end

@implementation BZFormScrollViewSubclassViewController

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
    } else if (sender == self.additionalField) {
        [self send];
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
