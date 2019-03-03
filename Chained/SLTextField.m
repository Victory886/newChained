//
//  SLTextField.m
//  Chained
//
//  Created by Terry on 2019/1/18.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "SLTextField.h"

@implementation SLTextField

/// 初始化
+ (SLTextField *)initTxt {
    
    return [[self alloc] init];
}

/// 内容
- (SLTextField *(^)(NSString *text))txt {
    
    __weak typeof (self)ws = self;
    return ^(NSString *text) {
        
        ws.text = text;
        return ws;
    };
}

/// txt 提示文字
- (SLTextField *(^)(NSString *text))pla_txt {
    
    __weak typeof (self)ws = self;
    return ^(NSString *text) {
        
        ws.placeholder = text;
        return ws;
    };
}

/// /// 内容的对齐方式 0 1 2 左 中 右
- (SLTextField *(^)(NSInteger ailgnment))ali {
    
    __weak typeof (self)ws = self;
    return ^(NSInteger ailgnment) {
        
        if (ailgnment == 0) {
            
            ws.textAlignment = NSTextAlignmentLeft;
        } else if (ailgnment == 1) {
            
            ws.textAlignment = NSTextAlignmentCenter;
        } else if (ailgnment == 2) {
            
            ws.textAlignment = NSTextAlignmentRight;
        } else {
            
            ws.textAlignment = NSTextAlignmentLeft;
        }
        return ws;
    };
}

/// 字体大小
- (SLTextField *(^)(float font))txtFont {
    
    __weak typeof (self)ws = self;
    return ^(float font) {
        
        ws.font = [UIFont systemFontOfSize:font];
        return ws;
    };
}

/// 字体大小
- (SLTextField *(^)(float bold_font))bold_font {
    
    __weak typeof (self)ws = self;
    return ^(float bold_font) {
        
        ws.font = [UIFont boldSystemFontOfSize:bold_font];
        return ws;
    };
}

/// 字体颜色
- (SLTextField *(^)(UIColor *color))txtClr {
    
    __weak typeof (self)ws = self;
    return ^(UIColor *color) {
        
        ws.textColor = color;
        return ws;
    };
}

/// 背景颜色
- (SLTextField *(^)(UIColor *color))bgClr {
    
    __weak typeof (self)ws = self;
    return ^(UIColor *color) {
        
        ws.backgroundColor = color;
        return ws;
    };
}

/// 隐藏、显示  -- 非0为真
- (SLTextField *(^)(BOOL isHidden))hid {
    
    __weak typeof (self)ws = self;
    return ^(BOOL isHidden) {
        
        ws.hidden = isHidden;
        return ws;
    };
}

/// 显示
- (SLTextField *(^)(UIView *superView))add {
    
    __weak typeof (self)ws = self;
    return ^(UIView *superView) {
        
        [superView addSubview:ws];
        return ws;
    };
}

@end
