//
//  AppDelegate.m
//  SCB
//
//  Created by idol_ios on 15/3/17.
//  Copyright (c) 2015年 idol_SR. All rights reserved.
//

#import "AppDelegate.h"
#import "SCBHomeViewController.h"
#import "SCBSortViewController.h"
#import "SCBOrderViewController.h"
#import "SCBPersonalCenterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


//是否显示登陆页这里你们来也判断通过给isLoggedIn赋值yes或no即可
-(void)ISorNOLogin
{
    //    判断是否加载登录页面
    BOOL isLoggedIn=YES;
    NSString *storyboardId = isLoggedIn ? @"SCBHomeView" : @"SCBLoginView";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *initViewController = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
    
    SCBSortViewController *SortViewController=[[SCBSortViewController alloc]init];
    SCBOrderViewController *OrderViewController=[[SCBOrderViewController alloc]init];
    SCBPersonalCenterViewController *PersonalCenterViewController=[[SCBPersonalCenterViewController alloc]init];
    UINavigationController *initNavigationController=[[UINavigationController alloc]initWithRootViewController:initViewController];
    UINavigationController *SortNavigationController=[[UINavigationController alloc]initWithRootViewController:SortViewController];
    UINavigationController *OrderNavigationController=[[UINavigationController alloc]initWithRootViewController:OrderViewController];
    UINavigationController *PersonalCenterNavigationController=[[UINavigationController alloc]initWithRootViewController:PersonalCenterViewController];
    UITabBarController *TabBarController=[[UITabBarController alloc]init];
    TabBarController.viewControllers=[NSArray arrayWithObjects:initNavigationController,SortNavigationController,OrderNavigationController,PersonalCenterNavigationController, nil];
    UITabBar *tabBar = TabBarController.tabBar;
    UITabBarItem *initTabBarItem = [tabBar.items objectAtIndex:0];
    UITabBarItem *FindGoodsTabBarItem = [tabBar.items objectAtIndex:1];
    UITabBarItem *DynamicTabBarItem = [tabBar.items objectAtIndex:2];
    UITabBarItem *MyTabBarItem = [tabBar.items objectAtIndex:3];
    initTabBarItem.title=@"首页";
    FindGoodsTabBarItem.title=@"分类";
    DynamicTabBarItem.title=@"订单管理";
    MyTabBarItem.title=@"个人中心";
//    下面tarbar加图片
    [initTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Foundation.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Foundation.png"]];
    [FindGoodsTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Foundation.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Foundation.png"]];
    [DynamicTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Foundation.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Foundation.png"]];
    [MyTabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"Foundation.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"Foundation.png"]];
    self.window.rootViewController = TabBarController;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self ISorNOLogin];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
