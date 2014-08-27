## HMUIButtonOnTouch

This UIButton category takes a block for touchUpInside calls.

### Usage

```objective-c

  // import the category
  #import "UIButton+HMUIButtonOnTouch.h"

  // adding a block for the touch up inside call
  [self.myButton onTouchInside:^{
        NSLog(@"on static button tap");
  }];

  // destroying
  [self.myButton onTouchInside:nil];

```
### Contact
http://hellomihai.wordpress.com/

### License

Available under the MIT License. See the LICENSE file for more.