//
//  AttributedUtils.h
//  IconLabel
//
//  Created by 超级腕电商 on 2017/11/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttributedUtils : NSObject
+ (instancetype)sharedClient;
-(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text andIconText:(NSString *)signText;
@end
