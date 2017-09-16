//
//  CartBottomView.m
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "CartBottomView.h"
#import "CommonUI.h"
#import "UIView+Size.h"


@implementation CartBottomView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor grayColor];
        [self addSubview:self.cartButton];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.cartButton.frame = CGRectMake(20, -30, 60, 60);
    self.cartButton.layer.masksToBounds = YES;
    self.cartButton.layer.cornerRadius = self.cartButton.width/2;
}

#pragma mark G

-(UIButton*)cartButton{
    if(!_cartButton){
        _cartButton = [CommonUI creatButtonWithFrame:CGRectZero backgroundColor:[UIColor purpleColor] title:@"" titleFont:[UIFont boldSystemFontOfSize:20] titleColor:[UIColor blackColor] actionBlock:^(UIControl *control) {
            
            
        }];
    }
    return _cartButton;
}
@end
