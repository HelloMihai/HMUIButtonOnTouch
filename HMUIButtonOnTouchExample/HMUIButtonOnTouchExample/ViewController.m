//
//  ViewController.m
//  HMUIButtonOnTouchExample
//
//  Created by Hello Mihai on 8/22/14.
//  Available under the MIT License. See the LICENSE file for more.
//

#import "ViewController.h"
#import "UIButton+HMUIButtonOnTouch.h"

@interface ViewController ()
@property (strong, nonatomic) NSTimer* timer;
@property (weak, nonatomic) IBOutlet UIButton *staticButton;
@property (strong, nonatomic) UIButton* dynamicButton;
@property (nonatomic) NSUInteger dynamicButtonCounter;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.dynamicButtonCounter = 0;
    
    [self.staticButton onTouchInside:^{
        NSLog(@"on static button tap");
    }];
    
    // create buttons on repeat and destroy to demonstrate memory leak
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.5 target:self selector:@selector(rebuildButton) userInfo:nil repeats: YES];
}

-(void)rebuildButton
{
    // destroy previous button
    if (self.dynamicButton) {
        [self.dynamicButton onTouchInside:nil]; // remove the on touch inside listener
        [self.dynamicButton removeFromSuperview];
        self.dynamicButton = nil;
    }
    
    // create a new button
    self.dynamicButtonCounter++;
    UIButton* button = [[UIButton alloc] init];
    NSString* buttonTitle = [NSString stringWithFormat:@"Button: %lu", (unsigned long)self.dynamicButtonCounter ];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    // add to the view
    [self.view addSubview:button];
    // just under the static button
    CGRect staticButtonFrame = self.staticButton.frame;
    button.frame = CGRectMake(0, staticButtonFrame.origin.y + 50, self.view.frame.size.width, staticButtonFrame.size.height);

    // block callback
    [button onTouchInside:^{
        NSLog(@"touch on button # %lu", (unsigned long)self.dynamicButtonCounter);
    }];
    
    self.dynamicButton = button;
}

@end
