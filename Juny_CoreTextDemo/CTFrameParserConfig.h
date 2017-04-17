//
//  CTFrameParserConfig.h
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat  width;//宽度
@property (nonatomic, assign) CGFloat fontSize;//字号
@property (nonatomic, assign) CGFloat lineSpace;//行间距
@property (nonatomic, strong) UIColor *textColor;//字体颜色

@end
