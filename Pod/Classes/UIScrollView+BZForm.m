//
//  UIScrollView+BZForm.m
//  Pods
//
//  Created by Youssef Meherzi on 22/02/2016.
//
//

#import "UIScrollView+BZForm.h"
#import <objc/runtime.h>

static char const * const kbHeightKey = "kbHeight";
static char const * const initialBottomKey = "initialBottom";

@implementation UIScrollView (BZForm)

- (void)registerListener {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification *)sender {
    self.kbHeight = [[[sender userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    UIEdgeInsets edgeInsets = self.contentInset;
    if (!self.initialBottom) {
        self.initialBottom = @(edgeInsets.bottom);
    }
    
    edgeInsets.bottom = self.kbHeight - [self bottomSpaceFromView:self];
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        [self setContentInset:edgeInsets];
        [self setScrollIndicatorInsets:edgeInsets];
    }];
}

-(CGFloat) bottomSpaceFromView:(UIView *) view {
    if (!view || !view.superview)
        return 0;
    CGFloat space = view.superview.frame.size.height - CGRectGetMaxY(view.frame);
    if (view.superview.superview)
        space += [self bottomSpaceFromView:view.superview];
    return space;
}

- (void)keyboardWillHide:(NSNotification *)sender {
    NSTimeInterval duration = [[[sender userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        UIEdgeInsets edgeInsets = self.contentInset;
        edgeInsets.bottom = [self.initialBottom floatValue];
        [self setContentInset:edgeInsets];
        [self setScrollIndicatorInsets:edgeInsets];
    }];
}

- (void) scrollToView:(UIView *) view {
    __block CGFloat toPoint = view.frame.origin.y - (self.frame.size.height - self.kbHeight - view.frame.size.height) + 5;
    if (toPoint > self.contentOffset.y) {
        [UIView animateWithDuration:0.5 animations:^{
            self.contentOffset = CGPointMake(0, toPoint);
        }];
    }
}

-(void) unregisterListener {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (CGFloat)kbHeight {
    return [objc_getAssociatedObject(self, kbHeightKey) floatValue];
}

- (void)setKbHeight:(CGFloat)value {
    objc_setAssociatedObject(self, kbHeightKey, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)initialBottom {
    return objc_getAssociatedObject(self, initialBottomKey);
}

- (void)setInitialBottom:(NSNumber *)value {
    objc_setAssociatedObject(self, initialBottomKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
