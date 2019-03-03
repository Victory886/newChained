//
//  SLObjC.m
//  Chained
//
//  Created by Terry on 2019/1/17.
//  Copyright © 2019 Terry. All rights reserved.
//

#import "SLLabel.h"

@implementation SLLabel

+ (SLLabel *)initLab {
    
    return [[self alloc] init];
}

- (SLLabel *(^)(NSString *text))txt {
    
    __weak typeof(self) weakSelf = self;
    return ^(NSString *text){
        
        weakSelf.text = text;
        return weakSelf;
    };
}

- (SLLabel *(^)(UIColor *bgColor))color {
    
    __weak typeof(self) weakSelf = self;
    return ^(UIColor *bgColor) {
      
        weakSelf.backgroundColor = bgColor;
        return weakSelf;
    };
}

- (SLLabel *(^)(UIColor *textColor))txtClr {
    
    __weak typeof(self) weakSelf = self;
    return ^(UIColor *textColor) {
        
        weakSelf.textColor = textColor;
        return weakSelf;
    };
}

- (SLLabel *(^)(NSInteger ailgnment))ali {
    
    __weak typeof(self) weakSelf = self;
    return ^(NSInteger ailgnment){
        if (ailgnment == 0) {
            
            weakSelf.textAlignment = NSTextAlignmentLeft;
        } else if (ailgnment == 1) {
            
            weakSelf.textAlignment = NSTextAlignmentCenter;
        } else if (ailgnment == 2) {
            
            weakSelf.textAlignment = NSTextAlignmentRight;
        } else {
            
            weakSelf.textAlignment = NSTextAlignmentLeft;
        }
        return weakSelf;
    };
}

- (SLLabel *(^)(float txt_font))txtFont {
    
    __weak typeof(self) weakSelf = self;
    return ^(float txt_font){
      
        weakSelf.font = [UIFont systemFontOfSize:txt_font];
        return weakSelf;
    };
}

- (SLLabel *(^)(float txt_bold_font))txtBoldFont {
    
    __weak typeof(self) weakSelf = self;
    return ^(float txt_bold_font){
        
        weakSelf.font = [UIFont boldSystemFontOfSize:txt_bold_font];
        return weakSelf;
    };
}

- (SLLabel *(^)(NSInteger lineNumber))lNum {
    
    __weak typeof(self) weakSelf = self;
    return ^(NSInteger lineNumber) {
        
        weakSelf.numberOfLines = lineNumber;
        return weakSelf;
    };
    
}

- (SLLabel *(^)(UIView *superView))add {
    
    __weak typeof (self) weadSelf = self;
    return ^(UIView *superView) {
        
        [superView addSubview:weadSelf];
        return weadSelf;
    };
}

- (SLLabel *(^)(BOOL isHidden))hid {
    
    __weak typeof (self) weadSelf = self;
    return ^(BOOL isHidden) {
        
        weadSelf.hidden = isHidden;
        return weadSelf;
    };
}

- (SLLabel *(^)(BOOL userEnab))userEnab {
    
    __weak typeof (self) weadSelf = self;
    return ^(BOOL userEnab) {
        
        weadSelf.userInteractionEnabled = userEnab;
        return weadSelf;
    };
}

@end
