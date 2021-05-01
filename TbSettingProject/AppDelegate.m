//
//  AppDelegate.m
//  TbSettingProject
//
//  Created by Tb on 2021/4/30.
//



#import "AppDelegate.h"
#import "SettingTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    SettingTableViewController *setting = [[SettingTableViewController alloc] init];
    self.window.rootViewController = setting;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
