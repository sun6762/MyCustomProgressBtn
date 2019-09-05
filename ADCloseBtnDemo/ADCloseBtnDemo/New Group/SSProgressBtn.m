//
//  SSProgressBtn.m
//  btnDemo
//
//  Created by ruiyu on 2019/8/7.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import "SSProgressBtn.h"

@implementation SSProgressBtn

- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0f);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1); 
    
    CGContextAddArc(context,
                    self.frame.size.width/2.0,
                    self.frame.size.height/2.0,
                    self.bounds.size.width/2.0,
                    0 ,
                    self.count/300.0 * 2* M_PI,
                    //                    2 * M_PI,
                    0);//这就是画曲线了
    /*
     CGContextAddArc(上下文对象    ,     圆心x,     圆心y,     曲线开始点,    曲线结束点,     半径);
     */
    CGContextStrokePath(context);
}

- (void)time{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(action) userInfo:nil repeats:YES];
}

- (void)action{
    self.count++;//时间累加
    if (self.count == 300) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self setNeedsDisplay];
}

@end
