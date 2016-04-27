//
//  ViewController.m
//  RACTest
//
//  Created by Seven on 16/4/26.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>///这个要纯手打，没有提示
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self textFild];
    [self button];
    [self gestureRecognizerTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  对textField事件的监听
 */
-(void)textFild
{
    UITextField *textField  = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
//    [[textField rac_signalForControlEvents:UIControlEventEditingChanged]subscribeNext:^(id x) {
//        /**
//         *  x==就是textField
//         */
//        UITextField *te = (UITextField *)x;
//        NSLog(@"值改变啦,%@",te.text);
//    }];


    /**
     *       *  这个是监听textFiled的所有事件
     *
     *  @param x textField对象
     *
     *  @return <#return value description#>
     */
    [[textField rac_textSignal]subscribeNext:^(id x) {
        NSLog(@"text");
    }];

}

/**
 *  button的事件监听
 */
-(void)button
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30, 50, 60, 30)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击button%@",x);
    }];
    
}

/**
 *  rac与手势
 */
-(void)gestureRecognizerTest
{

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]init];
    longPress.minimumPressDuration = 2;
    [self.view addGestureRecognizer:longPress];
    [[longPress rac_gestureSignal]subscribeNext:^(id x) {
        NSLog(@"长按手势");
    }];
}

@end
