//
//  ViewController.h
//  miniDemo
//
//  Created by gejingwen on 2023/11/21.
//

#import <UIKit/UIKit.h>
#import "MyCell.h"

typedef void (^tableBlock)(NSUInteger);

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ButtonDelegate>
{
    UITableView *_myTableView;
    
    //NSMutableArray表示可变数组，OC数组不能存储基本数据类型
    NSMutableArray *_arrayData;
    int item_index ;
    UIImageView *loadImage;
    
}
@property NSUInteger tempIndex;
@property (nonatomic , copy) tableBlock myTableBlock;
//@property (weak, nonatomic) UIImageView *loadImage;
@end

