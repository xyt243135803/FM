//
//  AppDelegate.m
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import "AppDelegate.h"
#import "YTTabBarController.h"
#import "YTTabBar.h"
#import "TestVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    YTTabBarController *rootVC = [YTTabBarController tabBarControllerWithAddChildVCsBlock:^(YTTabBarController *tabBarC) {
        [tabBarC addChildVC:[TestVC new] normalImageName:@"tabbar_find_n" selectedImageName:@"tabbar_find_h" isRequiredNavController:YES];
        [tabBarC addChildVC:[UIViewController new] normalImageName:@"tabbar_sound_n" selectedImageName:@"tabbar_sound_h" isRequiredNavController:YES];
        [tabBarC addChildVC:[UIViewController new] normalImageName:@"tabbar_download_n" selectedImageName:@"tabbar_download_h" isRequiredNavController:YES];
        [tabBarC addChildVC:[UIViewController new] normalImageName:@"tabbar_me_n" selectedImageName:@"tabbar_me_h" isRequiredNavController:YES];
    }];
    
    YTTabBar *tabbar = (YTTabBar *)rootVC.tabBar;
    tabbar.middleClickBlock = ^(BOOL isPlaying) {
        if (isPlaying) {
            NSLog(@"播放");
        }else {
            NSLog(@"暂停");
        }
    };

    
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
