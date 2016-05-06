//
//  ViewController.m
//  JXTextViewDemo
//
//  Created by FDZ021 on 16/5/6.
//  Copyright © 2016年 HunYu. All rights reserved.
//

#import "ViewController.h"
#import "JXTextView.h"

#define SCREENW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<JXTextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCREENW, 50)];
    view.backgroundColor = [UIColor grayColor];
    view.tag = 101;
    [self.view addSubview:view];
    
    JXTextView *textView = [[JXTextView alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    textView.placeholder = @"请输入内容";
    textView.backgroundColor = [UIColor whiteColor];
    textView.textDelegate = self;
    [view addSubview:textView];
}

-(void)textView:(JXTextView *)textView heightChange:(CGFloat)height{
    UIView *view = [self.view viewWithTag:101];
    CGRect frame = view.frame;
    frame.size.height = 20.0 + height;
    view.frame = frame;
}



@end
