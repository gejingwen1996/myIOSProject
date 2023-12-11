//
//  myCollectionCell.m
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import "myCollectionCell.h"

@implementation myCollectionCell

- (void)setItemData:(DataModel *)itemData{
    self.myTitle.text = itemData.title;
    self.myLabel.text = itemData.subtitle;
  //  NSLog(@"%@--%@",self.myTitle,itemData.title);
}

-(instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        //头图
        UIImageView *itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30)/2, 160)];
        
        itemImageView.image = [UIImage imageNamed:@"03.png"];
        [self.contentView addSubview:itemImageView];
        
        //主标题
        UILabel *itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 165, ([UIScreen mainScreen].bounds.size.width - 30)/2, 15)];
        itemTitle.font = [UIFont systemFontOfSize:12];
        self.myTitle = itemTitle;
        [self.contentView addSubview:itemTitle];
        
        //副标题
        UILabel *itemLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 180, ([UIScreen mainScreen].bounds.size.width - 30)/2, 20)];
        itemLabel.font = [UIFont systemFontOfSize:10];
        itemLabel.textColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.7];
        self.myLabel = itemLabel;
        [self.contentView addSubview:itemLabel];
        
    }
    return  self;
}


@end
