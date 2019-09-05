//
//  SSProgressBtn.h
//  btnDemo
//
//  Created by ruiyu on 2019/8/7.
//  Copyright © 2019 ruiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSProgressBtn : UIButton
@property (nonatomic, strong)NSTimer *timer;

@property (nonatomic, assign)int count;
 
- (void)time;

@end

NS_ASSUME_NONNULL_END
