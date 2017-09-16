//
//  UIControl+Button.h
//  Project
//
//  Created by 超级腕电商 on 2017/9/5.
//  Copyright © 2017年 super. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Button)

typedef void (^ActionBlock)(UIControl *control);
- (void)addMethodBlock:(ActionBlock)actionBlock WithEvents:(UIControlEvents)controlEvents;

@end
