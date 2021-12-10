//
//  YTMiddleView.h
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import <UIKit/UIKit.h>
/**
 背景图片的 content mode都是center
 xib去掉autoresize
 */

NS_ASSUME_NONNULL_BEGIN

@interface YTMiddleView : UIView

+ (instancetype)shareInstance;

/**
 快速创建中间视图

 @return 中间的视图
 */
+ (instancetype)middleView;

/**
 控制是否正在播放
 */
@property (nonatomic, assign) BOOL isPlaying;

/**
 中间图片
 */
@property (nonatomic, strong) UIImage *middleImg;

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end

NS_ASSUME_NONNULL_END
