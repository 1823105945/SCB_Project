//
//  ViewController.m
//  SCB
//
//  Created by idol_ios on 15/3/17.
//  Copyright (c) 2015年 idol_SR. All rights reserved.
//

#import "SCBHomeViewController.h"

@interface SCBHomeViewController ()

@end

@implementation SCBHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden=NO;
    /*
    //     也可以用alloc构建这里用单利演示
    [SCBNetworkRequest sharNetWork].delegate=self;
    [[SCBNetworkRequest sharNetWork] NetworkRequseURL:@"http://183.61.183.115/thirdapi/app55ding.php/app/getFlagshipIndex/name/ninuo" NetworkRequseType:@"POST" CachePath:@"name"];
    UIImageView *i=[[UIImageView alloc]initWithFrame:self.view.bounds];
    //    [[SCBNetworkRequest sharNetWork]requstImageView:i ImageURL:<#(NSString *)#> PlaceholderImageName:<#(NSString *)#>];
    [self.view addSubview:i];
    */
}
/*
-(void)NetworkRequestSuccess:(NSDictionary *)Dictionary
{
    NSLog(@"%@",Dictionary);
}

-(void)NetworkRequestFailure:(NSDictionary *)Dictionary
{
    NSLog(@"%@",Dictionary);
}

-(void)POSTNetworkRequest:(ASIFormDataRequest *)Request
{
    
}
-(void)dealloc
{
    [[SCBNetworkRequest sharNetWork]CancelRequest];
    
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 提示框
 LPPopup *popup = [LPPopup popupWithText:@"This is a Letterpress like popup. UILabel subclass. Enjoy!"];
 
 [popup showInView:self.view
 centerAtPoint:self.view.center
 duration:kLPPopupDefaultWaitDuration
 completion:nil];
 
 
 网络指示器
 HUD = [PackageView ProgressHUDTitle:@"加载中..." View:self];
 移除网络指示器
 [HUD removeFromSuperview];
 */

@end
