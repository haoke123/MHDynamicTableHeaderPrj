//
//  MHNaviBar.m
//  MHDynamicTableHeaderPrj
//
//  Created by 孟弘 on 2018/9/27.
//  Copyright © 2018年 孟弘. All rights reserved.
//

#import "MHNaviBar.h"

@interface MHNaviBar(){
    
    UIView * sepBg;
}
@end

@implementation MHNaviBar
-(instancetype) initWithFrame:(CGRect)frame{
    
    self  = [super initWithFrame:frame];
    
    if(self){
        
        sepBg = [[UIView alloc] initWithFrame:CGRectMake(0, -(frame.origin.y+ 20), frame.size.width, (frame.origin.y+ 20))];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 12, frame.size.width - 88, 20)];
        [self.titleLabel setTextColor:[UIColor orangeColor]];
        
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.titleLabel setContentMode:UIViewContentModeCenter];
        
        self.lefyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.lefyButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.rightButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
        
        [self.lefyButton setFrame:CGRectMake(8, 8, 28, 28)];
        
        [self.rightButton setFrame:CGRectMake(frame.size.width -36, 8, 28, 28)];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.lefyButton];
        [self addSubview:self.rightButton];
        
        [sepBg setBackgroundColor:self.backgroundColor];
        
        [self addSubview:sepBg];
        
        [self setSepStatus:NO];
        
        [self addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
 
}
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    [sepBg setBackgroundColor:self.backgroundColor];
    
    
}
-(void) setSepStatus:(BOOL)sepStatus{
    
    [self.titleLabel setTextColor:!sepStatus?[UIColor orangeColor]:[UIColor whiteColor]];
    [self.lefyButton setTintColor:!sepStatus?[UIColor orangeColor]:[UIColor whiteColor]];
    [self.rightButton setTintColor:!sepStatus?[UIColor orangeColor]:[UIColor whiteColor]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
