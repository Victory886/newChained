//
//  SLObjC.h
//  Chained
//
//  Created by Terry on 2019/1/17.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLLabel : UILabel

/// 初始化
+ (SLLabel *)initLab;

/// 设置内容
- (SLLabel *(^)(NSString *text))txt;

/// 背景颜色
- (SLLabel *(^)(UIColor *bgColor))color;

/// 字体颜色
- (SLLabel *(^)(UIColor *textColor))txtClr;

/// 内容的对齐方式 0 1 2 左 中 右
- (SLLabel *(^)(NSInteger ailgnment))ali;

/// 普通字体大小
- (SLLabel *(^)(float font))txtFont;

/// 加粗字体大小
- (SLLabel *(^)(float txt_bold_font))txtBoldFont;

/// 文本行数 默认为 一行
- (SLLabel *(^)(NSInteger lineNumber))lNum;

/// 添加到父视图上
- (SLLabel *(^)(UIView *superView))add;

/// 是否隐藏显示 yes no 或 0 1
- (SLLabel *(^)(BOOL isHidden))hid;

/// 用户交互开关 yes no 或 0 1
- (SLLabel *(^)(BOOL userEnab))userEnab;








@end

NS_ASSUME_NONNULL_END
