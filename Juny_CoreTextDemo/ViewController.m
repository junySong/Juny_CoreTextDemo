//
//  ViewController.m
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/5.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import "ViewController.h"
#import "DisplayView.h"
#import <CoreText/CoreText.h>
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "ShowView.h"

@interface ViewController ()

@property (nonatomic, strong) DisplayView *ctView;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.ctView = [[DisplayView alloc]init ];
//    self.ctView.frame = CGRectMake(50, 100, 300, 300);
//    
//
//    
//    CTFrameParserConfig *config = [[CTFrameParserConfig alloc]init];
//    config.textColor = [UIColor blackColor];
//    config.width = self.ctView.width;
//    
//    NSString *content =
//    @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
//    " 换为 CoreTextData 的方法。"
//    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
//    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
//    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
//    " 示成黑色，那么就办不到了。"
//    "\n\n"
//    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
//    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
//    " 我们想要的信息。";
//
//    NSDictionary *attr = [CTFrameParser attributesWithConfig:config];
//    NSMutableAttributedString *attributedString =
//    [[NSMutableAttributedString alloc] initWithString:content
//                                           attributes:attr];
//    [attributedString addAttribute:NSForegroundColorAttributeName
//                             value:[UIColor redColor]
//                             range:NSMakeRange(0, 7)];
//    
//    
//
//    
////    CoreTextData *data = [CTFrameParser parseContent:@" 按照以上原则，我们将`CTDisplayView`中的部分内容拆开。" config:config];
//    CoreTextData *data = [CTFrameParser  parseAttributeContent:attributedString config:config];
//    self.ctView.data = data;
//    self.ctView.height = data.height;
//    self.ctView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:self.ctView];

    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT)] ;
//    [self.view addSubview:textView];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"图片测试富文本显示"];
    //为所有文本设置字体
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, [attributedString length])];
    //将“测试”两字字体颜色设置为蓝色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 2)];
    //将“富文本”三个字字体颜色设置为红色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 3)];
    
    //在“测”和“试”两字之间插入一张图片
    NSString *imageName = @"Left.png";

    
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc]init];
    imageAttachment.image = [UIImage imageNamed:imageName];
    imageAttachment.bounds = CGRectMake(0, 0, 30, 30);
    NSDictionary *dictAttr9 = @{NSAttachmentAttributeName:imageAttachment};
    NSAttributedString *imageArr = [NSAttributedString attributedStringWithAttachment:imageAttachment];
    [attributedString insertAttributedString:imageArr atIndex:2];
    

    
    textView.attributedText = attributedString;
    
    
    
    ShowView *view = [[ShowView alloc]init];
    view.frame = CGRectMake(20, 100, 300, 300);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
