//
//  UIControl+Button.m
//  Project
//
//  Created by 超级腕电商 on 2017/9/5.
//  Copyright © 2017年 super. All rights reserved.
//

#import "UIControl+Button.h"
#import <objc/runtime.h>

@implementation UIControl (Button)
static char kButtonActionKey;

- (void)addMethodBlock:(ActionBlock)actionBlock WithEvents:(UIControlEvents)controlEvents{
    ///id object, const void *key, id value, objc_AssociationPolicy policy
    objc_setAssociatedObject(self, &kButtonActionKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(myAction) forControlEvents:controlEvents];
    
}

- (void)myAction{
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &kButtonActionKey);
    if (block) {
        block(self);
    }
}

@end
