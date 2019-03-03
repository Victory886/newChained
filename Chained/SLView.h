//
//  SLView.h
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SLGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface SLView : UIView


/// 初始化
+ (SLView *)initView;

/// 背景颜色
- (SLView *(^)(UIColor *color))bgClr;

/// 是否隐藏显示 yes no 或 0 1
- (SLView *(^)(BOOL isHidden))hid;

/// 添加到父视图上
- (SLView *(^)(UIView *superView))add;

/// 用户交互开关 yes no 或 0 1
- (SLView *(^)(BOOL userEnab))userEnab;

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)sl_addTapActionWithBlock:(SLGestureActionBlock)block;


@end

NS_ASSUME_NONNULL_END
