//
//  UIButton+HMUIButtonOnTouch.m
//  HMUIButtonOnTouchExample
//
//  Created by Hello Mihai on 8/22/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import "UIButton+HMUIButtonOnTouch.h"
#import <objc/runtime.h>

NSString * const UIButton_touch_category_key = @"kDHStyleKey";

@implementation UIButton (HMUIButtonOnTouch)

#pragma mark : accessors

-(void)setTouchInsideBlock:(void (^)())touchBlock
{
    objc_setAssociatedObject(self, (__bridge const void *)(UIButton_touch_category_key), touchBlock, OBJC_ASSOCIATION_COPY);
}

-(void (^)())touchInsideBlock
{
    return objc_getAssociatedObject(self, (__bridge const void *)(UIButton_touch_category_key));
}

#pragma mark : usage

-(void)onTouchInside:(void (^)())block
{
    self.touchInsideBlock = block;
    if (block)
        [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    else
        [self removeTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark : internals

-(IBAction)touchUpInside:(id)sender
{
    if (self.touchInsideBlock)
        self.touchInsideBlock(self);
}


@end
