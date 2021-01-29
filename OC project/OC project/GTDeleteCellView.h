//
//  GTDeleteCellView.h
//  OC project
//
//  Created by 总受 on 2021/1/29.
//  Copyright © 2021 zou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView

- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
