//
//  myTabbarController.m
//  miniDemo
//
//  Created by gejingwen on 2023/11/27.
//

#import "myTabbarController.h"
#import "ViewController.h"
#import "myUIButton.h"
#import "myNavigation.h"
#import "myNavigation.h"
#import "myCollectionView.h"


@interface myTabbarController ()

@end

@implementation myTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加子控制器
    ViewController *v1 = [[ViewController alloc] init];
    v1.navigationItem.title = @"导航一"; //????为什么要设置在这里
    //创建导航栏，并将其加入tabbar
    myNavigation *nav1 = [[myNavigation alloc] init];
    nav1.navigationItem.title = @"导航";   //为神马不好使？？？？
    [nav1 pushViewController:v1 animated:YES];
    
    
   // ViewController *v2 = [[ViewController alloc] init];
    UICollectionViewFlowLayout *myFlow = [[UICollectionViewFlowLayout alloc] init];
    myCollectionView *v2 = [[myCollectionView alloc] initWithCollectionViewLayout:myFlow];
    
    ViewController *v3 = [[ViewController alloc] init];
    v3.navigationItem.title = @"导航三";
    myNavigation *nav3 = [[myNavigation alloc] initWithRootViewController:v3];
//    nav3.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    self.viewControllers = @[nav1,v2,nav3];
    
    //使用自定义的底部控制栏
    UIView *tabbarButton = [[UIView alloc] init];
    tabbarButton.frame = self.tabBar.frame;
    tabbarButton.backgroundColor = [UIColor systemPinkColor];
    //定义三个按钮
    for(int i=0;i<self.viewControllers.count;i++){
        myUIButton *tb = [[myUIButton alloc] init];
        CGRect myScreenBounds = [[UIScreen mainScreen] bounds];
        CGFloat w = myScreenBounds.size.width / 3;
        CGFloat h = 50;
        CGFloat x = i * w;
        CGFloat y = 0;
        tb.frame = CGRectMake(x, y, w, h);
        tb.backgroundColor = [UIColor orangeColor];
        //监听tb，这里的参数为什么这么写？？？？？
        [tb addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
        //默认选中第一个，让i==0时执行一下点击函数既可
        if(i==0){
            [self tabBarButtonClick:tb];
        }
        //设置button的tag
        [tb setTag:i];
      //  self.selectedIndex = i;
        [tabbarButton addSubview:tb];
    }
    
    [self.view addSubview:tabbarButton];
    
    
}

//点击tb的事件处理
- (void) tabBarButtonClick:(UIButton*)tb{
    tb.selected = YES;
    tb.backgroundColor = [UIColor redColor];
    //点击时切换控制器
    self.selectedIndex = tb.tag;
    
//    NSLog(@"%lu",self.selectedIndex);
}

//- (void)setSelectedIndex:(NSUInteger)selectedIndex{
//    selectedIndex = selectedIndex;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
