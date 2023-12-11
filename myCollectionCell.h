//
//  myCollectionCell.h
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^myTableBlock)(NSUInteger);

@interface myCollectionCell : UICollectionViewCell

@property (nonatomic,weak) UIImageView *myImage;
@property (nonatomic,weak) UILabel *myTitle;
@property (nonatomic,weak) UILabel *myLabel;
@property (nonatomic,strong) DataModel *itemData;

@property (nonatomic,copy) myTableBlock firstCellBlock;
@end

NS_ASSUME_NONNULL_END
