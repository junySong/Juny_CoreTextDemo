//
//  DisplayView.m
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "DisplayView.h"

@implementation DisplayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
//    //得到当前绘制画布的上下文，用于后续将内容绘制再画布上
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    /*将坐标系上下旋转。对于底层的绘制引擎来说，屏幕的左下角是（0，0）坐标。
//    **而对于UIKit来说，左上角是（0，0）坐标。
//    **所以我们为了之后的坐标系描述按UIKit来做，所以现在这里做一个整体上移一个屏幕高度，上移后，0坐标点重合了
//    **然后Y坐标轴沿着X坐标轴旋转一周
//     */
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    
//    //
//    CGMutablePathRef path = CGPathCreateMutable();
////    CGPathAddRect(path, NULL, self.bounds);
//    CGPathAddEllipseInRect(path, NULL, self.bounds);
//    
//    //
//    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:@"Hello World! "
//                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
//                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
//                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
//                                     " 测试设置不同的绘制区域带来的界面变化。"];
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0, [attString length]), path, NULL);
//    
//    //
//    CTFrameDraw(frame, context);
//    
//    //
//    CFRelease(frame);
//    CFRelease(path);
//    CFRelease(framesetter);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
    }
    
    
    
    
}






@end
