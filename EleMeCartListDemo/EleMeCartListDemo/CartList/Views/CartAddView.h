//
//  CartAddView.h
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CALL_DELEGATE_WITH_ARG(_delegate, _selector, _argument) \
do { \
id _theDelegate = _delegate; \
if(_theDelegate != nil && [_theDelegate respondsToSelector:_selector]) { \
[_theDelegate performSelector:_selector withObject:_argument]; \
} \
} while(0);
#define Animation_Time     0.3

@class CartAddView;
@protocol CartAddViewDelegate <NSObject>

-(void)cartViewAddButtonActionWithCartAddView:(CartAddView *)cartAddView;

@end
@interface CartAddView : UIView

@property (nonatomic,strong) UITextField *numberTextfield;
@property (nonatomic,strong) UIButton *addButton;//加
@property (nonatomic,strong) UIButton *subtractBtn;//减
@property(nonatomic) int number;
@property(nonatomic) int minNumber;
@property(nonatomic) int maxNumber;
@property (nonatomic,weak) id<CartAddViewDelegate> delegate;

@end

