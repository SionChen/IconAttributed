//
//  ViewController.m
//  IconLabel
//
//  Created by 超级腕电商 on 2017/11/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "ViewController.h"
#import "AttributedUtils.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@property (nonatomic,strong) UILabel *textLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textLabel.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:self.textLabel];
    self.textLabel.attributedText = [[AttributedUtils sharedClient] titleAttributedStringWithText:@"文本字段文本字段文本字段文本字段文本字段文本字段文本字段" andIconText:@"京东自营"];
}

#pragma mark ---G
-(UILabel*)textLabel{
    if(!_textLabel){
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.numberOfLines = 2;
        _textLabel.userInteractionEnabled = YES;
    }
    return _textLabel;
}


@end
