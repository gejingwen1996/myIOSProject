//
//  myCollectionView.m
//  miniDemo
//
//  Created by gejingwen on 2023/12/3.
//

#import "myCollectionView.h"
#import "myCollectionCell.h"
#import "myFlowLayout.h"
#import "secondCollectionCell.h"
#import "ViewController.h"
#import "MyCell.h"
#import "SDWebImage/SDWebImage/include/SDWebImage/UIImageView+WebCache.h"

@interface myCollectionView ()


@end

@implementation myCollectionView

static NSString * const reuseIdentifier = @"Cell";
static NSString * const secondReuseIdentifier = @"secondCell";

int nextHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //此处需要注册两个不同的cell
    [self.collectionView registerClass:[myCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[secondCollectionCell class] forCellWithReuseIdentifier:secondReuseIdentifier];
    
    // Do any additional setup after loading the view.
   
    myFlowLayout *myLayOut = [[myFlowLayout alloc] init];
 //   myLayOut.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30)/2, 200);
    myLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    myLayOut.itemCount = 20;
    myLayOut.minimumLineSpacing = 10;
    myLayOut.minimumInteritemSpacing = 10;
    myLayOut.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
   
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height) collectionViewLayout:myLayOut];
    
    [self.collectionView registerClass:[myCollectionCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView registerClass:[secondCollectionCell class] forCellWithReuseIdentifier:@"secondCell"];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.6];
    
//    self.myTabbarBlock = ^(NSUInteger index){
//        NSLog(@"我的tabbarBlock被赋值了");
//    };
 
    [self.view addSubview:self.collectionView];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 120;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row % 2 == 1){
        myCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

        DataModel *m1 = [[DataModel alloc] init];
        m1.title = @"美团民宿，欢迎试住";
        m1.subtitle = @"诚邀您体验 >";

        cell.itemData = m1;


        return cell;
    }else{
        secondCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"secondCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];

        DataModel *m2 = [[DataModel alloc] init];
        m2.title = @"拿破仑";
        m2.subtitle = @"暂无评分 | 3.5万人想看";
        m2.price = @"¥18";
        cell.itemData = m2;

        return cell;
    }
        
    // Configure the cell
    
//    myCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//
//    DataModel *m1 = [[DataModel alloc] init];
//    m1.title = @"美团民宿，欢迎试住";
//    m1.subtitle = @"诚邀您体验 >";
//
//    cell.itemData = m1;
//
//
//    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row % 2 == 1){
//        NSLog(@"11111111");
//        myCollectionCell *cell1 = [collectionView cellForItemAtIndexPath:indexPath];
//        cell1.selected = YES;
//        if(cell1.firstCellBlock){
//            NSLog(@"cell1的block被赋值了");
//            cell1.firstCellBlock(indexPath.row);
//        }
//    }else{
//        secondCollectionCell *cell2 = [collectionView cellForItemAtIndexPath:indexPath];
//        cell2.selected = YES;
//        if(cell2.secondCellBlock){
//            NSLog(@"cell2的block被赋值了");
//            cell2.secondCellBlock(indexPath.row);
//        }
//       // [self.navigationController popViewControllerAnimated:YES];
//    }
//
    NSLog(@"%@",self.myTabbarBlock);
   
    if(self.myTabbarBlock){
        NSLog(@"进入了myTabbarBlock");
        myCollectionCell *tempCell = [collectionView cellForItemAtIndexPath:indexPath];
        NSString *sendStr = tempCell.myTitle.text;
        self.myTabbarBlock(indexPath.row,sendStr);
    }
   
    //用POP返回
    [self.navigationController popViewControllerAnimated:YES];

    
    
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
