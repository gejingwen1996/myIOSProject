//
//  secondCollectionCell.m
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import "secondCollectionCell.h"

@implementation secondCollectionCell


- (void)setItemData:(DataModel *)itemData{
    self.myTitle.text = itemData.title;
    self.myLabel.text = itemData.subtitle;
    self.myPrice.text = itemData.price;
  //  NSLog(@"%@--%@",self.myPrice,itemData.title);
}

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        //头图
        UIImageView *itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30)/2, 180)];
        
        itemImageView.image = [UIImage imageNamed:@"04.jpeg"];
        [self.contentView addSubview:itemImageView];
        
        //主标题
        UILabel *itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 185, ([UIScreen mainScreen].bounds.size.width - 30)/2, 15)];
        itemTitle.font = [UIFont systemFontOfSize:12];
        self.myTitle = itemTitle;
        [self.contentView addSubview:itemTitle];
        
        //副标题
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 200, ([UIScreen mainScreen].bounds.size.width - 30)/2, 20)];
        itemLabel.font = [UIFont systemFontOfSize:10];
        itemLabel.textColor = [UIColor lightGrayColor];
        self.myLabel = itemLabel;
        [self.contentView addSubview:itemLabel];
        
        //价格
        UILabel *itemPrice = [[UILabel alloc] initWithFrame:CGRectMake(5, 220, ([UIScreen mainScreen].bounds.size.width - 30)/2, 20)];
        itemPrice.font = [UIFont systemFontOfSize:14];
        itemPrice.textColor = [UIColor redColor];
   //     itemPrice.backgroundColor = [UIColor systemPinkColor];
        self.myPrice = itemPrice;
        [self.contentView addSubview:itemPrice];
        
    }
    return  self;
}

@end
