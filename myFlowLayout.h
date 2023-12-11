//
//  myFlowLayout.h
//  miniDemo
//
//  Created by gejingwen on 2023/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myFlowLayout : UICollectionViewFlowLayout

@property (nonatomic,assign) int itemCount;
@property (nonatomic,assign) int h;
@property (nonatomic,assign) CGFloat longestCol;
@end

NS_ASSUME_NONNULL_END
