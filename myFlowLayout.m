//
//  myFlowLayout.m
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import "myFlowLayout.h"

@implementation myFlowLayout
{
    NSMutableArray *attArray;
   // CGFloat h;
}
//布局更新的第一个回调
- (void)prepareLayout{
    [super prepareLayout];
    attArray = [[NSMutableArray alloc] init];
    float cellWidth = ([UIScreen mainScreen].bounds.size.width - 30)/2;
     
    //定义数组保存每一列的高度，下一个cell就放在最短列的后面
    CGFloat colHeight[2] = {self.sectionInset.top,self.sectionInset.bottom};
    
    //遍历cell的各式各样并为每个cell设置属性
    for(int i=0;i< _itemCount;i++){
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        //创建布局类
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        self.h = i % 2 == 1? 200 : 240;
        //标记较短的那一列,把新的cell放到较短的那一列
        int shortLine = 0;
       
        if( colHeight[0] < colHeight[1]){
            colHeight[0] = colHeight[0] + self.h + self.minimumLineSpacing;
            shortLine = 0;
        }else{
            colHeight[1] = colHeight[1] + self.h + self.minimumLineSpacing;
            shortLine = 1;
        }
        
        //设置cell的位置
    
        att.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + cellWidth)*shortLine, colHeight[shortLine] - self.h - self.minimumLineSpacing, cellWidth, self.h);
        //将生成的布局类放到数组中
        if(shortLine == 0){
            self.longestCol = colHeight[1];
        }else{
            self.longestCol = colHeight[0];
        }
        [attArray addObject:att];
    }
    
    //设置itemSize确保滑动范围的正确
   
    if(colHeight[0] > colHeight[1]){
        self.itemSize = CGSizeMake(cellWidth, (colHeight[0] - self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }else{
        self.itemSize = CGSizeMake(cellWidth, (colHeight[1] - self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }
}

//在该方法中返回布局数组
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return attArray;
}
//设置collectionView的尺寸,需要计算最长的那一列作为长度
- (CGSize)collectionViewContentSize{
   
    return CGSizeMake(self.collectionView.frame.size.width, self.longestCol);
}

@end
