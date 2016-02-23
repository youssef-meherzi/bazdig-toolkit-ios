//
//  BZFormScrollView.m
//  Pods
//
//  Created by Youssef Meherzi on 22/02/2016.
//
//

#import "BZFormScrollView.h"

@implementation BZFormScrollView

- (id)initWithFrame:(CGRect)aRect {
    if (self = [super initWithFrame:aRect]) {
        [self registerListener];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder {
    if (self = [super initWithCoder:coder]) {
        [self registerListener];
    }
    return self;
}

- (void)setDismissOnTap:(BOOL)dismissOnTap {
    [self setDismissOnTapEnabled:dismissOnTap];
}

-(void) dealloc {
    [self unregisterListener];
}

@end