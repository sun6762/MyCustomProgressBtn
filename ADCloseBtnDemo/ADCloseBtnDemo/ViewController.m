//
//  ViewController.m
//  ADCloseBtnDemo
//
//  Created by 战场原黑仪 on 2019/8/8.
//  Copyright © 2019 战场原黑仪. All rights reserved.
//

#import "ViewController.h"
#import "ADCloseButton.h"
#import "SSProgressBtn.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ADCloseButton *btn = [[ADCloseButton alloc] initWithFrame:CGRectMake(80, 80, 100, 100)];
    [btn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self createUI];
}

- (void)start:(ADCloseButton *)sender {
    [sender startAniamtion];
}


- (void)createUI{
    CGFloat width = 40;
    SSProgressBtn *btn = [SSProgressBtn new];
    btn.frame = CGRectMake(200, 100, width, width);
    [btn setTitle:@"跳过" forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    btn.backgroundColor = [UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:0.5];
    [self.view addSubview:btn];
    [self cutCornerRadius:btn andRadius:width/2.0];
    [btn time];
    
}

- (void)cutCornerRadius:(UIView *)view andRadius:(CGFloat)cornerRadius{
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds
                                          cornerRadius:cornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
}

@end
