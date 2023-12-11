//
//  myNavigation.m
//  miniDemo
//
//  Created by gejingwen on 2023/11/28.
//

#import "myNavigation.h"
#import "myTabbarController.h"

@interface myNavigation ()

@end

@implementation myNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    myTabbarController *tabbarController = [[myTabbarController alloc] init];
//    [self.navigationController pushViewController:tabbarController animated:YES];
    
    //获取当前控制器的导航栏并设置标题
    self.navigationItem.title = @"第一个导航栏";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
