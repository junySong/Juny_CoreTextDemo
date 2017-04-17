//
//  CTFrameParser.m
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser

+ (NSDictionary*)attributesWithConfig:(CTFrameParserConfig*)config{
    CGFloat fontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
    CGFloat lineSpace = config.lineSpace;
    const CFIndex kNumberOfSetting = 3;
    CTParagraphStyleSetting theSettings[kNumberOfSetting] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpace},
        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpace}
    };
    
    CTParagraphStyleRef theparaGraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSetting);
    
    UIColor *textColor = config.textColor;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dict[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dict[(id)kCTParagraphStyleAttributeName] = (__bridge id)theparaGraphRef;
    
    CFRelease(theparaGraphRef);
    CFRelease(fontRef);
    
    
    return dict;
    
}

+ (CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter
                                  config:(CTFrameParserConfig*)config
                                  height:(CGFloat)height{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.width, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
    
}

+ (CoreTextData*)parseContent:(NSString *)content config:(CTFrameParserConfig*)config{
    
    NSDictionary *attributes = [self attributesWithConfig:config];
    NSAttributedString *contentString = [[NSAttributedString alloc]initWithString:content attributes:attributes];
    
    //创建CTFramesetter实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
    
    //获得要绘制的区域的高度
    CGSize resrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, resrictSize, nil);
    CGFloat textHight = coreTextSize.height;
    
    //生成CTFRameRef实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHight];
    
    //将生成好的CTRrameRef实例和计算好的绘制高度保存在CoreTextData实例中，最后返回CoreText实例
    CoreTextData *data = [[CoreTextData alloc]init];
    data.ctFrame = frame;
    data.height = textHight;
    
    //释放内存
    CFRelease(frame);
    CFRelease(framesetter);
    return data;
}

+ (CoreTextData*)parseAttributeContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig*)config{
    // 创建CTFramesetterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    // 获得要缓制的区域的高度
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0,0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    // 生成CTFrameRef实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHeight];
    
    // 将生成好的CTFrameRef实例和计算好的缓制高度保存到CoreTextData实例中，最后返回CoreTextData实例
    CoreTextData *data = [[CoreTextData alloc] init];
    data.ctFrame = frame;
    data.height = textHeight;
//    data.content = content;
    
    // 释放内存
    CFRelease(frame);
    CFRelease(framesetter);
    return data;
}















@end
