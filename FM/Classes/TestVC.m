//
//  TestVC.m
//  FM
//
//  Created by xytisxyt on 2021/12/10.
//

#import "TestVC.h"
#import "TestVC2.h"

@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.view.tag = 666;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"摸到我了");
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
    
    [self.navigationController pushViewController:[TestVC2 new] animated:YES];
}

@end
