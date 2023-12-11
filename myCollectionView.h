//
//  myCollectionView.h
//  miniDemo
//
//  Created by gejingwen on 2023/12/3.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^tabbarBlock)(NSUInteger index,NSString *mystr);

@interface myCollectionView : UICollectionViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) DataModel *itemCell;

@property (nonatomic,copy) tabbarBlock myTabbarBlock;
@end

NS_ASSUME_NONNULL_END
