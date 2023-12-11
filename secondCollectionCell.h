//
//  secondCollectionCell.h
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^myTestBlock)(NSUInteger);

@interface secondCollectionCell : UICollectionViewCell

@property (nonatomic,weak) UIImageView *myImage;
@property (nonatomic,weak) UILabel *myTitle;
@property (nonatomic,weak) UILabel *myLabel;
@property (nonatomic,weak) UILabel *myPrice;
//@property (nonatomic,weak) UIImageView *myImage;
@property (nonatomic,strong) DataModel *itemData;

@property (nonatomic,copy) myTestBlock secondCellBlock;

@end

NS_ASSUME_NONNULL_END
