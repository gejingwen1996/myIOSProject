//
//  DataModel.h
//  miniDemo
//
//  Created by gejingwen on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, weak) UIImageView *imageIcon;
@property (nonatomic, copy) NSString *price;



@end

NS_ASSUME_NONNULL_END
