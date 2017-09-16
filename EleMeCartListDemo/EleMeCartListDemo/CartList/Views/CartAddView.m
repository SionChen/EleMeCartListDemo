//
//  CartAddView.m
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "CartAddView.h"
#import "CommonUI.h"
#import "UIView+Size.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


@implementation CartAddView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.number =0;
        self.maxNumber = 99;
        self.minNumber = 0;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.subtractBtn];
        [self addSubview:self.numberTextfield];
        [self addSubview:self.addButton];
        
    }
    return self;
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.numberTextfield.text = [NSString stringWithFormat:@"%d",self.number];
    self.subtractBtn.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
    self.numberTextfield.frame = CGRectMake(self.subtractBtn.right, 0, self.width-self.height*2, self.height);
    self.addButton.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
    self.addButton.right = self.width;
    self.subtractBtn.layer.cornerRadius = self.subtractBtn.width/2;
    self.addButton.layer.cornerRadius = self.addButton.width/2;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}

#pragma mark Action
-(void)showAnimation{
    self.subtractBtn.hidden=NO;
    self.subtractBtn.alpha = 0;
    self.subtractBtn.right = self.width;
    self.numberTextfield.hidden = NO;
    self.numberTextfield.alpha = 0;
    [UIView animateWithDuration:Animation_Time animations:^{
        self.subtractBtn.transform = CGAffineTransformRotate(self.subtractBtn.transform, -M_PI_2*3);
        self.subtractBtn.alpha = 1;
        self.subtractBtn.left = 0;
        self.numberTextfield.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)disMissAnimation{
    self.subtractBtn.hidden=NO;
    self.subtractBtn.alpha = 1;
    self.subtractBtn.left = 0;
    self.numberTextfield.hidden = YES;
    [UIView animateWithDuration:Animation_Time animations:^{
        self.subtractBtn.transform = CGAffineTransformRotate(self.subtractBtn.transform, -M_PI_2*3);
        self.subtractBtn.alpha = 0;
        self.subtractBtn.right = self.width;
    } completion:^(BOOL finished) {
        self.subtractBtn.hidden=YES;
    }];
}

#pragma mark G
-(UIButton*)addButton{
    if(!_addButton){
        _addButton = [CommonUI creatButtonWithFrame:CGRectZero backgroundColor:[UIColor clearColor] title:@"+" titleFont:[UIFont boldSystemFontOfSize:20] titleColor:[UIColor blackColor] actionBlock:^(UIControl *control) {
            if (self.number<self.maxNumber) {
                CALL_DELEGATE_WITH_ARG(self.delegate, @selector(cartViewAddButtonActionWithCartAddView:), self);
                if (self.number==0) {
                    [self showAnimation];
                }
                self.number++;
                self.numberTextfield.text =[NSString stringWithFormat:@"%d",self.number];
            }
        }];
        _addButton.titleEdgeInsets = UIEdgeInsetsMake(-1, 0.5, 1, -0.5);
        _addButton.layer.masksToBounds = YES;
        _addButton.layer.borderWidth = 0.5;
        _addButton.layer.borderColor = [UIColor blackColor].CGColor;
        
    }
    return _addButton;
}
-(UIButton*)subtractBtn{
    if(!_subtractBtn){
        _subtractBtn = [CommonUI creatButtonWithFrame:CGRectZero backgroundColor:[UIColor clearColor] title:@"-" titleFont:[UIFont boldSystemFontOfSize:20] titleColor:[UIColor blackColor] actionBlock:^(UIControl *control) {
            if (self.number>self.minNumber) {
                if (self.number==1) {
                    [self disMissAnimation];
                }
                self.number--;
                self.numberTextfield.text =[NSString stringWithFormat:@"%d",self.number];
            }
            
        }];
        _subtractBtn.transform = CGAffineTransformRotate(_subtractBtn.transform, M_PI_2);
        _subtractBtn.hidden = YES;
        _subtractBtn.titleEdgeInsets = UIEdgeInsetsMake(-1, 0.5, 1, -0.5);
        _subtractBtn.layer.masksToBounds = YES;
        _subtractBtn.layer.borderWidth = 0.5;
        _subtractBtn.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _subtractBtn;
}
-(UITextField*)numberTextfield{
    if(!_numberTextfield){
        _numberTextfield = [[UITextField alloc] init];
        _numberTextfield.backgroundColor = [UIColor clearColor];
        _numberTextfield.textColor = [UIColor blackColor];
        _numberTextfield.textAlignment = NSTextAlignmentCenter;
        _numberTextfield.enabled = NO;
        _numberTextfield.hidden = YES;
    }
    return _numberTextfield;
}
@end
