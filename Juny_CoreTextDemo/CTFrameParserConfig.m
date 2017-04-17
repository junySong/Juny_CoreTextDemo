//
//  CTFrameParserConfig.m
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (id)init{
    self = [super init];
    if (self) {
        _width = 200.0f;
        _fontSize = 15.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);
    }
    return self;
}

@end
