//
//  GTListLoader.m
//  OC project
//
//  Created by 总受 on 2021/1/31.
//  Copyright © 2021 zou. All rights reserved.
//

#import "GTListLoader.h"
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock {
    
    NSArray<GTListItem *> *listdata = [self _readDataFromLocal];
    if (listdata) {
        finishBlock(YES, listdata);
    }
    
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
    
//    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session =[NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary: info];
            [listItemArray addObject: listItem];
        }
        
        [weakSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(error == nil,listItemArray.copy);
            }
        });
        
    }];
    
    [dataTask resume];
//    [self _getSandBoxPath];
}

- (NSArray<GTListItem *> *)_readDataFromLocal{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSFileManager *fileMange = [NSFileManager defaultManager];
    
    NSData *readListData = [fileMange contentsAtPath:listDataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<GTListItem *> *)unarchiveObj;
    }
    return nil;
}

- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileMange = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileMange createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileMange createFileAtPath:listDataPath contents:listData attributes:nil];
    
//    NSData *readListData = [fileMange contentsAtPath:listDataPath];
    
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readListData error:nil];
    
//    [[NSUserDefaults standardUserDefaults] setObject:@"abc" forKey:@"listData"];
//
//    NSData *testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
//
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:testListData error:nil];
    
    //查询文件
//    BOOL fileExist = [fileMange fileExistsAtPath:listDataPath];
    
    //删除
//    if (fileExist){
//        [fileMange removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
}

@end
