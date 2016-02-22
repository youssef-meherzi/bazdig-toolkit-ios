//
//  UIScrollView+BZForm.h
//  Pods
//
//  Created by Youssef Meherzi on 22/02/2016.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (BZForm)

- (void)registerListener;
- (void)unregisterListener;

- (void)scrollToView:(UIView *) view;

@end
