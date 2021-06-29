//
//  GTListLoader.h
//  OC project
//
//  Created by 总受 on 2021/1/31.
//  Copyright © 2021 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

@interface GTListLoader : NSObject

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
