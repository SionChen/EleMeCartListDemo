//
//  CartListTableViewCell.m
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "CartListTableViewCell.h"
#import "CartAddView.h"
#import "UIView+Size.h"

@implementation CartListTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.addView];
    }
    
    return self;
}
-(void)setDelegate:(id<CartAddViewDelegate>)delegate{
    self.addView.delegate = delegate;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.addView.frame = CGRectMake(0, 0, 90, 25);
    self.addView.bottom = self.height-15;
    self.addView.right = self.width-20;
}

#pragma mark G
-(CartAddView*)addView{
    if(!_addView){
        _addView = [[CartAddView alloc] init];
    }
    return _addView;
}

@end
