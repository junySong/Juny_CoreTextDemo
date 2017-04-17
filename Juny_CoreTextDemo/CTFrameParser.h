//
//  CTFrameParser.h
//  Juny_CoreTextDemo
//
//  Created by 宋俊红 on 17/4/6.
//  Copyright © 2017年 Juny_song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTFrameParserConfig.h"
#import "CoreTextData.h"


@interface CTFrameParser : NSObject

+ (NSDictionary*)attributesWithConfig:(CTFrameParserConfig*)config;

+ (CoreTextData*)parseContent:(NSString *)content config:(CTFrameParserConfig*)config;

+ (CoreTextData*)parseAttributeContent:(NSMutableAttributedString *)content config:(CTFrameParserConfig*)config;


@end
