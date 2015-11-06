//
//  ViewController.m
//  LocalNotification
//
//  Created by 杨晓晨 on 15/11/6.
//  Copyright © 2015年 杨晓晨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //iOS8之后 需要注册通知类型  包含哪些(声音,图标文字,文本) 信息
    /*
     UIUserNotificationTypeNone    = 0,
     UIUserNotificationTypeBadge   = 1 << 0, 包含图标文字  0001
     UIUserNotificationTypeSound   = 1 << 1, // 声音      0010
     UIUserNotificationTypeAlert   = 1 << 2, // 主题内容  0100
     */
    //0111
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
    
    [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1.创建一个本地通知
    UILocalNotification *local= [[UILocalNotification alloc]init];
    /*
     // timer-based scheduling 定制  特定的时间发出通知
     @property(nonatomic,copy) NSDate *fireDate; 触发 时间
     @property(nonatomic,copy) NSTimeZone *timeZone; 时区
     
     @property(nonatomic) NSCalendarUnit repeatInterval; 重复间隔     // 0 means don't repeat
     @property(nonatomic,copy) NSCalendar *repeatCalendar; 重复间隔
     
     @property(nonatomic,copy) CLRegion *region NS_AVAILABLE_IOS(8_0);//区域
     
     @property(nonatomic,assign) BOOL regionTriggersOnce NS_AVAILABLE_IOS(8_0); //决定区域的一个bool值
     
     // alerts
     @property(nonatomic,copy) NSString *alertBody;  提醒的主题
     @property(nonatomic) BOOL hasAction;                // NO 不显示滑动解锁的按钮 反之 显示
     @property(nonatomic,copy) NSString *alertAction;    //滑动解锁的文字
     @property(nonatomic,copy) NSString *alertLaunchImage;   //点击通知横幅的启动程序的 启动 图片
     @property(nonatomic,copy) NSString *alertTitle   提示的标题文字
     
     // sound 默认: UILocalNotificationDefaultSoundName
     @property(nonatomic,copy) NSString *soundName;
     // badge
     @property(nonatomic) NSInteger applicationIconBadgeNumber;  //图标文字
     // user info
     @property(nonatomic,copy) NSDictionary *userInfo;   // 用户指定的携带参数
     [UIUserNotificationSettings settingsForUserNotificationTypes:userNotificationActionSettings:]
     @property (nonatomic, copy) NSString *category NS_AVAILABLE_IOS(8_0);分类
     */
    //设置属性
    local.alertBody = @"女神:在吗?";
    
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    local.soundName = UILocalNotificationDefaultSoundName;
    
    local.alertAction = @"约";
    
    local.applicationIconBadgeNumber = 8;
    
    local.userInfo = @{@"name":@"女神",@"content":@"在吗?",@"time":@"20180815"};
    
    //应用级别
    //定制一个通知 用代理  监听什么接收到通知
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
    
    //立即发出通知
    //[[UIApplication sharedApplication]presentLocalNotificationNow:local];
    
    //取消所有的本地通知
    //[[UIApplication sharedApplication]cancelAllLocalNotifications];
    
    NSDictionary *dict = @{@"name info":@"zhangsa"};
    
    NSLog(@"%@",dict[@"name info"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
