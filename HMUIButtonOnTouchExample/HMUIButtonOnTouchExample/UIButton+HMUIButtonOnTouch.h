//
//  UIButton+HMUIButtonOnTouch.h
//  HMUIButtonOnTouchExample
//
//  Created by Hello Mihai on 8/22/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import <UIKit/UIKit.h>

@interface UIButton (HMUIButtonOnTouch)

@property (nonatomic, copy) void (^touchInsideBlock)();

-(void)onTouchInside:(void (^)())block;

@end
