//
//  ADCloseButton.m
//  ADCloseBtnDemo
//
//  Created by 战场原黑仪 on 2019/8/8.
//  Copyright © 2019 战场原黑仪. All rights reserved.
//

#import "ADCloseButton.h"

@interface ADCloseButton()

@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, weak)CAShapeLayer *circleLayer;
@end

@implementation ADCloseButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.frame.size.width/2.0f-3 startAngle:M_PI_2*3-0.001 endAngle:M_PI_2*3 clockwise:NO];
    [path closePath];
    
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1].CGColor;
    backgroundLayer.path = path.CGPath;
    [self.layer addSublayer:backgroundLayer];
    

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.strokeColor = [UIColor redColor].CGColor;
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.path = path.CGPath;
    self.circleLayer = circleLayer;
    [self.layer addSublayer:circleLayer];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    if (self.state == UIControlStateNormal) {
        self.titleLabel.text = @"跳过";
    }
    [self.titleLabel sizeToFit];
    self.titleLabel.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self addSubview:self.titleLabel];

}

- (void)startAniamtion {
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"strokeStart";
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.repeatCount = 1;
    animation.duration = 5;
    animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];;
    [self.circleLayer addAnimation:animation forKey:nil];
}
//
//- (void)drawRect:(CGRect)rect {
//
//}


@end
