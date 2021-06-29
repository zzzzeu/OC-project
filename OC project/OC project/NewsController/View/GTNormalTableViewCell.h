//
//  GTNormalTableViewCell.h
//  OC project
//
//  Created by 总受 on 2021/1/27.
//  Copyright © 2021 zou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic, weak, readwrite) id<GTNormalTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
