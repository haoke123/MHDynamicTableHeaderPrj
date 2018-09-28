//
//  ViewController.m
//  MHDynamicTableHeaderPrj
//
//  Created by 孟弘 on 2018/9/27.
//  Copyright © 2018年 孟弘. All rights reserved.
//

#import "ViewController.h"
#import "MHNaviBar.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * mainTable;
    
    UIImageView * imageView;
    
    CGFloat radio;
    
    CGFloat ogHeaderHigh;
    
    MHNaviBar * bar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIImage * image = [UIImage imageNamed:@"splash"];
    
    radio = image.size.height/image.size.width;
    
    imageView  =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.width * radio)];
    
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setImage:image];
    
    [imageView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:imageView];
    
    ogHeaderHigh = imageView.frame.size.width * radio;

    mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    mainTable.backgroundColor = [UIColor clearColor];
    
    UIView * headerContain  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ogHeaderHigh)];
    [mainTable setTableHeaderView:headerContain];
    [mainTable setDelegate:self];
    
    [mainTable setDataSource:self];
    
   [self.view addSubview:mainTable];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    MHNaviBar * naviBar = [[MHNaviBar alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 44)];
    [naviBar.lefyButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [naviBar.rightButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [naviBar.titleLabel setText:@"我的"];
    
    naviBar.backgroundColor = [UIColor clearColor];
    [naviBar setFrame:CGRectMake(0, 44, self.view.frame.size.width, 44)];
    
    bar = naviBar;
    
    [bar.lefyButton addTarget:self action:@selector(go2Next) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:naviBar];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) viewDidAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES];
}
-(void) viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES];
}
-(void) viewDidDisappear:(BOOL)animated{
    
    
}
-(void) viewWillDisappear:(BOOL)animated{
    
    
    [self.navigationController setNavigationBarHidden:NO];
    
}
-(void) go2Next{
    
    
    UIViewController * vc = [[UIViewController alloc] init];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [vc setTitle:@"哈哈"];
    
    [vc setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.21;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"row %ld",indexPath.row]];
    
    return cell;
}
-(void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(scrollView.contentOffset.y>0){
        
        [imageView setFrame:CGRectMake(0, -scrollView.contentOffset.y, self.view.frame.size.width, ogHeaderHigh)];
        
        CGFloat sep = scrollView.contentOffset.y-ogHeaderHigh+bar.frame.origin.y;
        
        bar.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:sep<0?scrollView.contentOffset.y/(ogHeaderHigh -bar.frame.origin.y):1];
        
        if(sep >0){
            bar.sepStatus  =YES;
            
        }else{
            
            bar.sepStatus = NO;
            
        }

    }else if (scrollView.contentOffset.y ==0){
    }
    
    else{

        [imageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, ogHeaderHigh-  scrollView.contentOffset.y)];
    }
}
@end
