//
//  GTListItem.h
//  OC project
//
//  Created by 总受 on 2021/2/5.
//  Copyright © 2021 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject <NSSecureCoding>

@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *picUrl;
@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *articleUrl;

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
