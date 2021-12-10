//
//  YTTabBarController.m
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import "YTTabBarController.h"
#import "YTTabBar.h"
#import "YTNavigationController.h"
#import "YTMiddleView.h"
#import "UIImage+XMGImage.h"

@interface YTTabBarController ()

@end

@implementation YTTabBarController

+ (instancetype)shareInstance {
    static YTTabBarController *tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarC = [[YTTabBarController alloc] init];
    });
    return tabbarC;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(YTTabBarController *tabBarC))addVCBlock {

    YTTabBarController *tabbarVC = [[YTTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }

    return tabbarVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置tabbar
    [self setUpTabbar];
}

- (void)setUpTabbar {
    [self setValue:[[YTTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {

    if (isRequired) {
        YTNavigationController *nav = [[YTNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];

        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }

}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];

    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        vc.view.tag = 888;
        
        YTMiddleView *middleView = [YTMiddleView middleView];
        middleView.middleClickBlock = [YTMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [YTMiddleView shareInstance].isPlaying;
        middleView.middleImg = [YTMiddleView shareInstance].middleImg;
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];
    }
    
    
}

@end
