//
//  ViewController.m
//  miniDemo
//
//  Created by gejingwen on 2023/11/21.
//

#import "ViewController.h"
#import "MyCell.h"
#import "DataModel.h"
#import "myCollectionView.h"
#import "myTabbarController.h"
#import "AppDelegate.h"
#import "secondCollectionCell.h"
#import "myFlowLayout.h"
#import "myCollectionCell.h"
#import "secondCollectionCell.h"
#import "SDWebImage/SDWebImage/include/SDWebImage/UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController


- (void) touchDown{
    NSLog(@"在viewController中实现了touchDown");
    
    myCollectionCell *firstCell = [[myCollectionCell alloc] init];
    firstCell.firstCellBlock = ^(NSUInteger index){
        NSLog(@"数据回传了：%ld",index);
    };
    
    //创建弹窗
    UIAlertController *myAlertContor = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了按钮" preferredStyle:UIAlertControllerStyleAlert];
    //添加确定，取消按钮
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        NSLog(@"OK Action");
    }];
    UIAlertAction *cannelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        NSLog(@"Cannel Action");
    }];
    [myAlertContor addAction:okAction];
    [myAlertContor addAction:cannelAction];
    //显示alert
    [self presentViewController:myAlertContor animated:YES completion:nil];
//    [self presentingViewController:myAlertContor animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //设置代理对象
    _myTableView.delegate = self;
    //设置数据代理对象
    _myTableView.dataSource = self;
    
    
    //显示tableView
    [self.view addSubview:_myTableView];
    [_myTableView registerClass:[MyCell class] forCellReuseIdentifier:@"status"];
    
//    self.myTableBlock =  ^(NSUInteger index) {
//        NSLog(@"viewController的myTableBlock触发了");
//        myFlowLayout *newFlow = [[myFlowLayout alloc] init];
//        myCollectionView *cv = [[myCollectionView alloc] initWithCollectionViewLayout:newFlow];
//        [self.navigationController pushViewController:cv animated:YES];
//
//    };
    
//    [_myTableView registerClass:[MyCell1 class] forCellReuseIdentifier:@"status1"];
    _arrayData = [[NSMutableArray alloc] init];
   loadImage = [[UIImageView alloc] init];
//    NSURL *imageUrl = [NSURL URLWithString:@"https://p0.meituan.net/scpdeal/929ec6f22173c2123213786b35a4b88e2499106.png"];
////    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
//    NSURLRequest *myRequest = [NSURLRequest requestWithURL:imageUrl];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *myTask = [session dataTaskWithRequest:myRequest completionHandler:^(NSData *_Nullable data,NSURLResponse *_Nullable response, NSError *_Nullable error){
////        self.responseData = data;
////        [self performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>];
//
//
//        //处理返回的数据
//
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            loadImage.image = [UIImage imageWithData:data];
//        });
//    }];
//    //执行
//    [myTask resume];
    
    for(int i='A';i<'Z';i++){
        NSString *str = [NSString stringWithFormat:@"%c",i];
        DataModel *model = [[DataModel alloc] init];
        model.title = [NSString stringWithFormat:@"%@%c%@",@"沙野轻食（ ",i,@"号店 ）"];
        model.subtitle = [str stringByAppendingFormat:@"内容"];
      //  model.imageIcon = loadImage;
        [_arrayData addObject:model];
       
    }
       
}

//数据源方法：获取组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//数据源方法：获取每组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}
//数据源方法：每组的每行返回什么内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"status";
    
    //通过自定义的方式来获取单元格
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //通过xib的方式来获取单元格
//  MyCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"miniCell" owner:nil options:nil] firstObject];
    cell.delegate = self;
//
    cell.tempData = _arrayData[indexPath.row];
    
    
    NSURL *imageUrl = [NSURL URLWithString:@"https://p0.meituan.net/scpdeal/929ec6f22173c2123213786b35a4b88e2499106.png"];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:imageUrl];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *myTask = [session dataTaskWithRequest:myRequest completionHandler:^(NSData *_Nullable data,NSURLResponse *_Nullable response, NSError *_Nullable error){
//        self.responseData = data;
//        [self performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>];
        
        
        //处理返回的数据
       
        dispatch_sync(dispatch_get_main_queue(), ^{
            cell.myImage.image = [UIImage imageWithData:data];
        });
    }];
    //执行
    [myTask resume];
   
    return cell;
}
//获取高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
//获取头部标题
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"头部标题";
}
//获取每组尾部标题
-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"尾部标题";
}
//获取头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
//获取尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}

//选中cell时触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // NSInteger selectCell = [indexPath row];
//    MyCell *selectNow = [tableView cellForRowAtIndexPath:indexPath];
//    if(selectNow.testBlock){
//        selectNow.testBlock(indexPath.row);
//    }
    
//    myCollectionCell *firstCell = [[myCollectionCell alloc] init];
//    firstCell.firstCellBlock = ^(NSUInteger index){
//        NSLog(@"数据回传了：%ld",index);
//    };

    myFlowLayout *myLayOut = [[myFlowLayout alloc] init];
    myCollectionView *cv = [[myCollectionView alloc] initWithCollectionViewLayout:myLayOut];
    cv.myTabbarBlock = ^(NSUInteger index,NSString *str){
//        self.tempIndex = index;
        NSIndexPath *indexPatch = [NSIndexPath indexPathWithIndex:index];
        MyCell *c1 = [tableView cellForRowAtIndexPath:indexPath];
        NSString *myIndex = [NSString stringWithFormat:@"%lu",index];
        c1.myTextView.text = [str stringByAppendingFormat:myIndex];
        NSLog(@"myTabbarBlock被触发");
        
    };
    [self.navigationController pushViewController:cv animated:YES];
    
//    if(self.myTableBlock){
//        self.myTableBlock(indexPath.row);
//    }
}



@end
