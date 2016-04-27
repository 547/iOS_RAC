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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  
 */
-(void)textFild
{
    UITextField *textField  = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    [[textField rac_signalForControlEvents:UIControlEventEditingChanged]subscribeNext:^(id x) {
        /**
         *  x==就是textField
         */
        UITextField *te = (UITextField *)x;
        NSLog(@"值改变啦,%@",te.text);
    }];
    
    

}

@end
