//
//  CartListTableViewCell.h
//  EleMeCartListDemo
//
//  Created by 超级腕电商 on 2017/9/15.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartAddView.h"
@class CartAddView;

@interface CartListTableViewCell : UITableViewCell

@property (nonatomic,strong) CartAddView *addView;
@property (nonatomic,weak) id<CartAddViewDelegate> delegate;
@end

