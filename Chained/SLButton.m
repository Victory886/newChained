//
//  SLButton.m
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "SLButton.h"
#import <objc/runtime.h>
static const void *sl_UIButtonBlockKey = &sl_UIButtonBlockKey;


@implementation SLButton

/// 初始化
+ (SLButton *)initBtn {
    
    return [self buttonWithType:(UIButtonTypeCustom)];
}

/// 设置内容 普通
- (SLButton *(^)(NSString *text))txtN {
    
    __weak typeof (self) ws = self;
    return ^(NSString *text) {
        
        [ws setTitle:text forState:(UIControlStateNormal)];
        return ws;
    };
}

/// 设置内容 高亮
- (SLButton *(^)(NSString *text))txtH {
    
    __weak typeof (self) ws = self;
    return ^(NSString *text) {
        
        [ws setTitle:text forState:(UIControlStateHighlighted)];
        return ws;
    };
}

/// 设置内容 选中
- (SLButton *(^)(NSString *text))txtS {
    
    __weak typeof (self) ws = self;
    return ^(NSString *text) {
        
        [ws setTitle:text forState:(UIControlStateSelected)];
        return ws;
    };
}

/// 设置内容 选中
- (SLButton *(^)(NSString *text))txtNSH {
    
    __weak typeof (self) ws = self;
    return ^(NSString *text) {
        
        [ws setTitle:text forState:(UIControlStateNormal)];
        [ws setTitle:text forState:(UIControlStateSelected)];
        [ws setTitle:text forState:(UIControlStateHighlighted)];
        return ws;
    };
}

/// 背景颜色
- (SLButton *(^)(UIColor *bgColor))colorN {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *bgColor) {
        
        [ws sl_setBackgroundColor:bgColor forState:UIControlStateNormal];
        [ws sl_setBackgroundColor:bgColor forState:UIControlStateHighlighted];
        return ws;
    };
}

/// 背景颜色 选中
- (SLButton *(^)(UIColor *bgColor))colorS {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *bgColor) {
        
        [ws sl_setBackgroundColor:bgColor forState:UIControlStateSelected];
        return ws;
    };
}

/// 字体颜色 普通
- (SLButton *(^)(UIColor *textColor))txtClrN {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *textColor) {
        
        [ws setTitleColor:textColor forState:(UIControlStateNormal)];
        return ws;
    };
}

/// 字体颜色 高亮
- (SLButton *(^)(UIColor *textColor))txtClrH {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *textColor) {
        
        [ws setTitleColor:textColor forState:(UIControlStateHighlighted)];
        return ws;
    };
}

/// 字体颜色 选中
- (SLButton *(^)(UIColor *textColor))txtClrS {
    
    __weak typeof (self) ws = self;
    return ^(UIColor *textColor) {
        
        [ws setTitleColor:textColor forState:(UIControlStateSelected)];
        return ws;
    };
}

/// 普通 按钮图标
- (SLButton *(^)(NSString *imgName))imgN {
    
    __weak typeof (self) ws = self;
    return ^(NSString *imgName) {
        
        [ws setImage:[UIImage imageNamed:imgName] forState:(UIControlStateNormal)];
        [ws setImage:[UIImage imageNamed:imgName] forState:(UIControlStateHighlighted)];
        return ws;
    };
}

/// 选中 按钮图标
- (SLButton *(^)(NSString *imgName))imgS {
    
    __weak typeof (self) ws = self;
    return ^(NSString *imgName) {
        
        [ws setImage:[UIImage imageNamed:imgName] forState:(UIControlStateSelected)];
        return ws;
    };
}

/// 普通 按钮背景图片
- (SLButton *(^)(NSString *imgName))bgImgN {
    
    __weak typeof (self) ws = self;
    return ^(NSString *imgName) {
        
        [ws setBackgroundImage:[UIImage imageNamed:imgName] forState:(UIControlStateNormal)];
        [ws setBackgroundImage:[UIImage imageNamed:imgName] forState:(UIControlStateHighlighted)];
        return ws;
    };
}

/// 选中 按钮背景图片
- (SLButton *(^)(NSString *imgName))bgImgS {
    
    __weak typeof (self) ws = self;
    return ^(NSString *imgName) {
        
        [ws setBackgroundImage:[UIImage imageNamed:imgName] forState:(UIControlStateSelected)];
        return ws;
    };
}

/// 内容的对齐方式 0 1 2 左 中 右
- (SLButton *(^)(NSInteger ailgnment))ali {
    
    __weak typeof (self) ws = self;
    return ^(NSInteger ailgnment) {
        
        if (ailgnment == 1)
            ws.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        else if (ailgnment == 2)
            ws.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        else if (ailgnment == 0)
            ws.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        return ws;
    };
}

/// 普通字体大小 普通
- (SLButton *(^)(float font))txtFont {
    
    __weak typeof (self) ws = self;
    return ^(float font) {
        
        ws.titleLabel.font = [UIFont systemFontOfSize:font];
        return ws;
    };
}

/// 普通字体大小 普通
- (SLButton *(^)(float bold_font))txtBoldFont {
    
    __weak typeof (self) ws = self;
    return ^(float bold_font) {
        
        ws.titleLabel.font = [UIFont boldSystemFontOfSize:bold_font];
        return ws;
    };
}

/// 添加到父视图上
- (SLButton *(^)(UIView *superView))add {
    
    __weak typeof (self) ws = self;
    return ^(UIView *superView) {
        
        [superView addSubview:ws];
        return ws;
    };
}

/// 是否隐藏显示 yes no 或 0 1
- (SLButton *(^)(BOOL isHidden))hid {
    
    __weak typeof (self) ws = self;
    return ^(BOOL isHidden) {
        
        ws.hidden = isHidden;
        return ws;
    };
}

/// 是否选中状态 yes no 或 0 1
- (SLButton *(^)(BOOL isSelected))select {
    
    __weak typeof (self) ws = self;
    return ^(BOOL isSelected) {
        
        ws.selected = isSelected;
        return ws;
    };
    
}

/// 用户交互开关 yes no 或 0 1
- (SLButton *(^)(BOOL userEnab))userEnab {
    
    __weak typeof (self) ws = self;
    return ^(BOOL userEnab) {
        
        ws.userInteractionEnabled = userEnab;
        return ws;
    };
}



- (void)sl_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    
    [self setBackgroundImage:[SLButton sl_b_imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)sl_b_imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



- (void)sl_addActionHandler:(SLTouchedButtonBlock)touchHandler {
    
    objc_setAssociatedObject(self, sl_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(sl_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sl_blockActionTouched:(UIButton *)btn {
    
    SLTouchedButtonBlock block = objc_getAssociatedObject(self, sl_UIButtonBlockKey);
    if (block) {
        btn.selected = !btn.selected;
        block(btn);
    }
}



@end
