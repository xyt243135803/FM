//
//  YTTabBar.m
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import "YTTabBar.h"
#import "YTMiddleView.h"
#import "UIView+XMGLayout.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface YTTabBar ()
@property (nonatomic, weak) YTMiddleView *middleView;
@end

@implementation YTTabBar

/**
 懒加载中间控件

 @return 中间的按钮控件
 */
- (YTMiddleView *)middleView {
    if (_middleView == nil) {
        YTMiddleView *middleView = [YTMiddleView shareInstance];
        [self addSubview:middleView];
        _middleView = middleView;
    }
    return _middleView;
}

// 这里可以做一些初始化设置
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit {

    // 设置样式, 去除tabbar上面的黑线
    self.barStyle = UIBarStyleBlack;

    // 设置tabbar 背景图片
    self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];


    // 添加一个按钮, 准备放在中间
    CGFloat width = 65;
    CGFloat height = 65;
    self.middleView.frame = CGRectMake((kScreenWidth - width) * 0.5, (kScreenHeight - height), width, height);

}

-(void)setMiddleClickBlock:(void (^)(BOOL))middleClickBlock {
    self.middleView.middleClickBlock = middleClickBlock;
}

-(void)layoutSubviews {
    [super layoutSubviews];

    // 将中间按钮, 移动到顶部
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [window.rootViewController.view bringSubviewToFront:self.middleBtn];


    NSInteger count = self.items.count;

    // 1. 遍历所有的子控件
    NSArray *subViews = self.subviews;

    // 确定单个控件的大小
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;

    NSInteger index = 0;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == count / 2) {
                index ++;
            }

            CGFloat btnX = index * btnW;
            subView.frame = CGRectMake(btnX, btnY, btnW, btnH);

            index ++;
        }
    }

    self.middleView.centerX = self.frame.size.width * 0.5;
    self.middleView.y = self.height - self.middleView.height;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{

    // 设置允许交互的区域
    // 1. 转换点击在tabbar上的坐标点, 到中间按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.middleView];

    // 2. 确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(33, 33);

    // 3. 计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));

    // 4. 判定中间按钮区域之外
    if (distance > 33 && pointInMiddleBtn.y < 18) {
        return NO;
    }

    return YES;
}



@end
