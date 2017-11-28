//
//  AttributedUtils.m
//  IconLabel
//
//  Created by 超级腕电商 on 2017/11/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "AttributedUtils.h"
#import <UIKit/UIKit.h>
//#define isSimulator  [[UIDevice currentDevice].model rangeOfString:@"Simulator"].location != NSNotFound
@interface AttributedUtils()
@property (nonatomic,strong) UILabel *applyLabel;//这里持有是为了layer渲染优化
@end
@implementation AttributedUtils

+ (instancetype)sharedClient {
    static AttributedUtils *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AttributedUtils alloc] init];
    });
    return _sharedClient;
}

#pragma mark Method

/**
 带有标签的富文本字符串

 @param text text
 @param signText icontext
 @return -
 */
-(NSMutableAttributedString *)titleAttributedStringWithText:(NSString *)text andIconText:(NSString *)signText{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@", text]];
    //NSTextAttachment可以将要插入的图片作为特殊字符处理
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    //定义图片内容及位置和大小
    UIImage * signImage = [self iconWithText:signText];
    attch.image = signImage;
    attch.bounds = CGRectMake(0, 0, signImage.size.width, signImage.size.height);
    //创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //将图片放在最后一位
    //[attri appendAttributedString:string];
    //将图片放在第一位
    [attri insertAttributedString:string atIndex:0];
    [attri addAttribute:NSBaselineOffsetAttributeName value:@(-3) range:NSMakeRange(0, 1)];
    return attri;
}

/**
 文本转图片

 @param text -
 @return -
 */
-(UIImage *)iconWithText:(NSString *)text{
    
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    self.applyLabel.frame = CGRectMake(0, 0, size.width+8, 16);
    self.applyLabel.text = text;
    return [self imageWithUIView:self.applyLabel];
}
/**
 view装image
 
 @param view view
 @return image
 */
- (UIImage*) imageWithUIView:(UIView*) view
{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(TARGET_IPHONE_SIMULATOR?view.bounds.size.width:view.bounds.size.width-1, view.bounds.size.height),YES, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetBlendMode(ctx, kCGBlendModeNormal);
    CGContextFillRect(ctx, view.bounds);
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}
#pragma mark ---G
-(UILabel*)applyLabel{
    if(!_applyLabel){
        _applyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _applyLabel.backgroundColor = [UIColor redColor];
        _applyLabel.textColor = [UIColor whiteColor];
        //_applyLabel.text = text;
        _applyLabel.layer.masksToBounds = YES;
        _applyLabel.layer.cornerRadius = 3;
        _applyLabel.layer.shouldRasterize = YES;
        _applyLabel.textAlignment = NSTextAlignmentCenter;
        _applyLabel.font = [UIFont systemFontOfSize:12];
    }
    return _applyLabel;
}
@end
