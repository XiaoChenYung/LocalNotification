//
//  AppDelegate.m
//  LocalNotification
//
//  Created by 杨晓晨 on 15/11/6.
//  Copyright © 2015年 杨晓晨. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *  接收到本地通知的时候就会调用
 *  程序在前台: 会调用     程序在后台:点击横幅 就算接收通知 也会调用  -> 程序活着就会调用
 *  @param application  应用
 *  @param notification 通知
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //调试:
    //1>控制台
    NSLog(@"%@",notification);
    
    //2>添加控件
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    label.backgroundColor = [UIColor redColor];
    
    label.text = [NSString stringWithFormat:@"%@",notification];
    
    [self.window.rootViewController.view addSubview:label];
    //跳转对应的界面
}
/**
 *  程序从死到生   程序启动:1> 点击图标启动  2> 接收通知(点击横幅)
 *
 *  @param application   <#application description#>
 *  @param launchOptions <#launchOptions description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //UIApplicationLaunchOptionsLocalNotificationKey 接收到本地通知才会来到这里
    UILocalNotification *info = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (info) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
        label.backgroundColor = [UIColor orangeColor];
        
        [self.window.rootViewController.view addSubview:label];
        
        
        
        //取出携带信息
        
        label.numberOfLines = 0;
        //NSDictionary *dict = info[@"UIConcreteLocalNotification"];
        // NSArray *keys = [info allKeys];
        //for (NSString *str in keys) {
        //   label.text = [NSString stringWithFormat:@"%@",str];
        //}
        //NSDictionary *dict1 = dict[@"user info"];
        
        label.text = [NSString stringWithFormat:@"%@",info.userInfo];
        //跳转对应的界面
    }
    
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
