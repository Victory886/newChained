//
//  SLButton.h
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SLTouchedButtonBlock)(UIButton *btn);

@interface SLButton : UIButton

-(void)sl_addActionHandler:(SLTouchedButtonBlock)touchHandler;

/// 初始化
+ (SLButton *)initBtn;

/// 设置内容 普通
- (SLButton *(^)(NSString *text))txtN;

/// 设置内容 高亮
- (SLButton *(^)(NSString *text))txtH;

/// 设置内容 选中
- (SLButton *(^)(NSString *text))txtS;

/// 设置内容
- (SLButton *(^)(NSString *text))txtNSH;

/// 背景颜色 普通
- (SLButton *(^)(UIColor *bgColor))colorN;

/// 背景颜色 选中
- (SLButton *(^)(UIColor *bgColor))colorS;


/// 字体颜色 普通
- (SLButton *(^)(UIColor *textColor))txtClrN;

/// 字体颜色 高亮
- (SLButton *(^)(UIColor *textColor))txtClrH;

/// 字体颜色 选中
- (SLButton *(^)(UIColor *textColor))txtClrS;

/// 普通 按钮图标
- (SLButton *(^)(NSString *imgName))imgN;

/// 选中 按钮图标
- (SLButton *(^)(NSString *imgName))imgS;

/// 普通 按钮背景图片
- (SLButton *(^)(NSString *imgName))bgImgN;

/// 选中 按钮背景图片
- (SLButton *(^)(NSString *imgName))bgImgS;


/// 内容的对齐方式 0 1 2 左 中 右
- (SLButton *(^)(NSInteger ailgnment))ali;

/// 普通字体大小 普通
- (SLButton *(^)(float font))txtFont;

/// 加粗字体大
- (SLButton *(^)(float bold_font))txtBoldFont;

/// 添加到父视图上
- (SLButton *(^)(UIView *superView))add;

/// 是否隐藏显示 yes no 或 0 1
- (SLButton *(^)(BOOL isHidden))hid;

/// 是否选中状态 yes no 或 0 1
- (SLButton *(^)(BOOL isSelected))select;

/// 用户交互开关 yes no 或 0 1
- (SLButton *(^)(BOOL userEnab))userEnab;

@end

NS_ASSUME_NONNULL_END
