//
//  SLImageView.m
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "SLImageView.h"
#import <objc/runtime.h>

static char sl_kActionHandlerTapBlockKey;
static char sl_kActionHandlerTapGestureKey;

@implementation SLImageView

//_twoImg.contentMode = UIViewContentModeScaleAspectFill;

+ (SLImageView *)initImg {
    
    return [[self alloc] init];
}

- (SLImageView *(^)(NSString *imgName))imgName {
    
    __weak typeof (self) ws = self;
    return ^(NSString *imgName) {
        
        ws.image = [UIImage imageNamed:imgName];
        return ws;
    };
}

- (SLImageView *(^)(UIColor *color))bgClr {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *color) {
        
        ws.backgroundColor = color;
        return ws;
    };
}

/// 0 1 2 ToFill AspectFit AspectFill
- (SLImageView *(^)(NSInteger model))imgModel {
    
    __weak typeof (self) ws = self;
    return ^(NSInteger model) {

        if (model == 0) {
            
            ws.contentMode = UIViewContentModeScaleToFill;
        } else if (model == 1) {
            
            ws.contentMode = UIViewContentModeScaleAspectFit;
        } else if (model == 2) {
            
            ws.contentMode = UIViewContentModeScaleAspectFill;
        }
        return ws;
    };
}

/// 添加到父视图上
- (SLImageView *(^)(UIView *superView))add {
    
    __weak typeof (self) ws = self;
    return ^(UIView *superView) {
        
        [superView addSubview:ws];
        return ws;
    };
}

/// 是否隐藏显示 yes no 或 0 1
- (SLImageView *(^)(BOOL isHidden))hid {
    
    __weak typeof (self) ws = self;
    return ^(BOOL isHidden) {
        
        ws.hidden = isHidden;
        return ws;
    };
}

/// 用户交互开关 yes no 或 0 1
- (SLImageView *(^)(BOOL userEnab))userEnab {
    
    __weak typeof (self) ws = self;
    return ^(BOOL userEnab) {
        
        ws.userInteractionEnabled = userEnab;
        return ws;
    };
}



- (void)sl_addTapActionWithBlock:(SLGestureActionBlock)block {
    
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &sl_kActionHandlerTapGestureKey);
    if (!gesture) {
        
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jk_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &sl_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &sl_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)jk_handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        
        SLGestureActionBlock block = objc_getAssociatedObject(self, &sl_kActionHandlerTapBlockKey);
        if (block) {
            
            block(gesture);
        }
    }
}


@end
