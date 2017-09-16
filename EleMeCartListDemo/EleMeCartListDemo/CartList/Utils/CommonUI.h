//
//  CommonUI.h
//  
//
//  Created by 超级腕电商 on 16/12/16.
//  Copyright © 2016年 super. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIControl+Button.h"

@interface CommonUI : NSObject

+ (UIBarButtonItem *)rightBarBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
//
+ (UIButton *)rightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;


/**
 创建按钮
 
 @param frame
 @param backgroundColor
 @param title
 @param font
 @param color
 @param actionBlock
 @return
 */
+(UIButton *)creatButtonWithFrame:(CGRect)frame
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title
                        titleFont:(UIFont *)font
                       titleColor:(UIColor *)color
                      actionBlock:(ActionBlock)actionBlock;

@end
