//
//  SLImageView.h
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SLGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface SLImageView : UIImageView

+ (SLImageView *)initImg;

- (SLImageView *(^)(NSString *imgName))imgName;

/// 0 1 2 ToFill AspectFit AspectFill
- (SLImageView *(^)(NSInteger model))imgModel;


/// 添加到父视图上
- (SLImageView *(^)(UIColor *color))bgClr;

/// 添加到父视图上
- (SLImageView *(^)(UIView *superView))add;

/// 是否隐藏显示 yes no 或 0 1
- (SLImageView *(^)(BOOL isHidden))hid;

/// 用户交互开关 yes no 或 0 1
- (SLImageView *(^)(BOOL userEnab))userEnab;

/**
 *  @brief  添加tap手势
 *  @param block 代码块
 */
- (void)sl_addTapActionWithBlock:(SLGestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END
