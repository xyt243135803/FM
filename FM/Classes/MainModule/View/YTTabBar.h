//
//  YTTabBar.h
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTTabBar : UITabBar

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end

NS_ASSUME_NONNULL_END
