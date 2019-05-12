//
//  SLTextField.h
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLTextField : UITextField

/// 初始化
+ (SLTextField *)initTxt;

/// 内容
- (SLTextField *(^)(NSString *text))txt;

/// txt 提示文字
- (SLTextField *(^)(NSString *text))pla_txt;

/// 内容的对齐方式 0 1 2 左 中 右
- (SLTextField *(^)(NSInteger ailgnment))ali;

/// 字体大小
- (SLTextField *(^)(float font))txtFont;

/// 字体颜色
- (SLTextField *(^)(UIColor *color))txtClr;

/// 背景颜色
- (SLTextField *(^)(UIColor *color))bgClr;

/// 隐藏、显示  -- 0 1
- (SLTextField *(^)(BOOL isHidden))hid;

/// 显示
- (SLTextField *(^)(UIView *superView))add;
/// 用户交互开关 yes no 或 0 1

/// 密码框
- (SLTextField *)isPwd;

@end

NS_ASSUME_NONNULL_END
