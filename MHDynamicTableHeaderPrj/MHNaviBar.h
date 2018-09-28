//
//  MHNaviBar.h
//  MHDynamicTableHeaderPrj
//
//  Created by 孟弘 on 2018/9/27.
//  Copyright © 2018年 孟弘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHNaviBar : UIView
@property (strong, nonatomic)  UIButton *lefyButton;
@property (strong, nonatomic)  UIButton *rightButton;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (nonatomic,assign) BOOL sepStatus;

@end
