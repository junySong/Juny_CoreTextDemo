//
//  DisplayView.h
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//
/*
 **对于一个复杂的排版引擎来说，可以将其功能拆成以下几个类来完成
 **1、一个显示用的类，仅负责显示内容，不负责排版
 **2、一个模板类，用于承载显示所需要的所有数据
 **3、一个排版类，用于实现文字内容的排版
 **4、一个配置类，用于实现排版时可配置项
 */

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "CoreTextData.h"

@interface DisplayView : UIView

@property (nonatomic, strong) CoreTextData *data;//

@end
