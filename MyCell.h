//
//  MyCell.h
//  miniDemo
//
//  Created by gejingwen on 2023/11/22.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
//#import "UIImageView+WebCache.h"

NS_ASSUME_NONNULL_BEGIN
//委托
@protocol ButtonDelegate <NSObject>

- (void) touchDown;

@end

//自定义一个带参数的block
typedef void (^myTableBlock)(NSUInteger);


@interface MyCell : UITableViewCell
@property (nonatomic, strong) DataModel *tempData;

//@property int item_index;
@property (weak, nonatomic) UITextView *myTextView;
@property (weak) id<ButtonDelegate> delegate;

//定义一个block，用block实现跳转
@property (nonatomic, copy) myTableBlock testBlock;

@property (weak, nonatomic) UIImageView *myImage;

@end

NS_ASSUME_NONNULL_END
