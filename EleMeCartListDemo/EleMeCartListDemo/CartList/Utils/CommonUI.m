//
//  CommonUI.m
//
//
//  Created by 超级腕电商 on 16/12/16.
//  Copyright © 2016年 super. All rights reserved.
//
#import "CommonUI.h"
#import "UIView+Size.h"

@implementation CommonUI

+ (UIButton *)itemButtonWithTitle:(NSString *)title
                           target:(id)target
                           action:(SEL)action
                            image:(UIImage *)image
                    selectedImage:(UIImage *)selectedImage
{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitle:title forState:(UIControlStateHighlighted)];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    [button setImage:image forState:(UIControlStateNormal)];
    [button setImage:selectedImage forState:(UIControlStateHighlighted)];
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    return button;
}

+ (UIBarButtonItem *)navItemBack:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemBack"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action
                                                   image:image
                                           selectedImage:nil];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItemSetting:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemSetting"];
    UIImage *selectedImage = [UIImage imageNamed:@"navItemSettingSelected"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action
                                                     image:image
                                           selectedImage:selectedImage];
    itemButton.frame = CGRectMake(0, 0, 44, 44);
    itemButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIButton *)rightButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setBackgroundColor:[UIColor clearColor]];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [itemButton setTitle:title forState:(UIControlStateNormal)];
    [itemButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [itemButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [itemButton.titleLabel sizeToFit];
    itemButton.width = itemButton.titleLabel.width;
    itemButton.height = 44.0;
    return itemButton;
}

+ (UIBarButtonItem *)rightBarBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *itemButton = [CommonUI rightButtonWithTitle:title target:target action:action];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    return barItem;
}

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
                      actionBlock:(ActionBlock)actionBlock
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addMethodBlock:actionBlock WithEvents:UIControlEventTouchUpInside];
    return button;
}

@end
