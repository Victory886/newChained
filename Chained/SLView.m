//
//  SLView.m
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "SLView.h"
#import <objc/runtime.h>

static char sl_kActionHandlerTapBlockKey;
static char sl_kActionHandlerTapGestureKey;

@implementation SLView

- (void)sl_addTapActionWithBlock:(SLGestureActionBlock)block {
    
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &sl_kActionHandlerTapGestureKey);
    
    if (!gesture) {
        
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sl_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &sl_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &sl_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)sl_handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        
        SLGestureActionBlock block = objc_getAssociatedObject(self, &sl_kActionHandlerTapBlockKey);
        if (block) {
            
            block(gesture);
        }
    }
}

/// 初始化
+ (SLView *)initView {
    
    return [[SLView alloc] init];
}

/// 背景颜色
- (SLView *(^)(UIColor *color))bgClr {
    
    __weak typeof (self)ws = self;
    return ^(UIColor *color) {
        
        ws.backgroundColor = color;
        return ws;
    };
}

/// 隐藏、显示  -- 非0为真
- (SLView *(^)(BOOL isHidden))hid {
    
    __weak typeof (self)ws = self;
    return ^(BOOL isHidden) {
        
        ws.hidden = isHidden;
        return ws;
    };
}

/// 显示
- (SLView *(^)(UIView *superView))add {
    
    __weak typeof (self)ws = self;
    return ^(UIView *superView) {
        
        [superView addSubview:ws];
        return ws;
   
    };
}

/// 用户交互开关 yes no 或 0 1
- (SLView *(^)(BOOL userEnab))userEnab {
    
    __weak typeof (self) ws = self;
    return ^(BOOL userEnab) {
        
        ws.userInteractionEnabled = userEnab;
        return ws;
    };
}

@end
