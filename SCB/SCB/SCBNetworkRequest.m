//
//  SCBNetworkRequest.m
//  SCB
//
//  Created by Liu on 15/3/23.
//  Copyright (c) 2015年 idol_SR. All rights reserved.
//

#import "SCBNetworkRequest.h"


static SCBNetworkRequest *NetworkRequest;
@implementation SCBNetworkRequest

-(id)init
{
    self=[super init];
    if (self) {
        
    }
    return self;
}

+(SCBNetworkRequest *)sharNetWork
{
    if (NetworkRequest==nil) {
        NetworkRequest=[[SCBNetworkRequest alloc]init];
    }
    return NetworkRequest;
}
//网络请求接口post和get
-(void)NetworkRequseURL:(NSString *)RequseURLurl NetworkRequseType:(NSString *)RequseType CachePath:(NSString *)cachePath
{
    type=RequseType;
    if ([RequseType isEqualToString:@"GET"]) {
        
        [self requstGet:RequseURLurl CachePath:cachePath];
    }else if ([RequseType isEqualToString:@"POST"])
    {
        
        [self requstPOST:RequseURLurl CachePath:cachePath];
    }
    
}
//get请求
-(void)requstGet:(NSString *)URl CachePath:(NSString *)cachePath
{
    //    self.HTTPRequest=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IPAndHost,URl]]];
    self.HTTPRequest=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",URl]]];
    //        设置请求超时时间
    [self.HTTPRequest setTimeOutSeconds : 60 ];
    //        设置超时自动重传
    [self.HTTPRequest setNumberOfTimesToRetryOnTimeout:2];
    //获取全局变量
    cache = [[ASIDownloadCache alloc] init];
    //设置缓存路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    [cache setStoragePath:[documentDirectory stringByAppendingPathComponent:cachePath]];
    [cache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
    //设置缓存方式
    [self.HTTPRequest setDownloadCache:cache];
    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
    [self.HTTPRequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [self.HTTPRequest setCompletionBlock:^{
        NSString *responseString=[self.HTTPRequest responseString];
        NSData *jsonData=[responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dictionary=[jsonData objectFromJSONData];
        if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(NetworkRequestSuccess:)]) {
            [self.delegate NetworkRequestSuccess:dictionary];
        }
    }];
    [self.HTTPRequest setFailedBlock:^{
        NSError *error=[self.HTTPRequest error];
        NSLog(@"%@",error.userInfo);
        if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(NetworkRequestFailure:)]) {
            [self.delegate NetworkRequestFailure:error.userInfo];
        }
    }];
    /*
     [self.HTTPRequest setDataReceivedBlock:^(NSData *data) {
     //开始接收数据的时候调用
     }];
     
     
     [self.HTTPRequest setStartedBlock:^{
     //请求开始的时候调用
     }];
     */
    
    [self.HTTPRequest startAsynchronous];
}
//post请求
-(void)requstPOST:(NSString *)RequseURL CachePath:(NSString *)cachePath
{
    self.FormDataRequest=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IPAndHost,RequseURL]]];
    [self.FormDataRequest addRequestHeader:@"Content-Type" value:@"binary/octet-stream"];
    [self.FormDataRequest setRequestMethod:@"POST"];
    //        设置请求超时时间
    [self.FormDataRequest setTimeOutSeconds : 60 ];
    //        设置超时自动重传
    [self.FormDataRequest setNumberOfTimesToRetryOnTimeout:2];
    //获取全局变量
    cache = [[ASIDownloadCache alloc] init];
    //设置缓存路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    [cache setStoragePath:[documentDirectory stringByAppendingPathComponent:cachePath]];
    [cache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
    //设置缓存方式
    [self.FormDataRequest setDownloadCache:cache];
    //设置缓存数据存储策略，这里采取的是如果无更新或无法联网就读取缓存数据
    [self.FormDataRequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(POSTNetworkRequest:)]) {
        //post接口必须实现此回调 公开ASIFormDataRequest类
        [self.delegate POSTNetworkRequest:self.FormDataRequest];
    }
    //    请求成功
    [self.FormDataRequest setCompletionBlock:^{
        NSString *responseString=[self.FormDataRequest responseString];
        NSData *jsonData=[responseString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dictionary=[jsonData objectFromJSONData];
        if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(NetworkRequestSuccess:)]) {
            [self.delegate NetworkRequestSuccess:dictionary];
        }
    }];
    //    请求失败
    [self.FormDataRequest setFailedBlock:^{
        NSError *error=[self.FormDataRequest error];
        NSLog(@"%@",error.userInfo);
        if (self.delegate!=nil&&[self.delegate respondsToSelector:@selector(NetworkRequestFailure:)]) {
            [self.delegate NetworkRequestFailure:error.userInfo];
        }
    }];
    /*
     [self.FormDataRequest setDataReceivedBlock:^(NSData *data) {
     //开始接收数据的时候调用
     }];
     
     
     [self.FormDataRequest setStartedBlock:^{
     //请求开始的时候调用
     }];*/
    
    [self.FormDataRequest startAsynchronous];
    
}

//取消网络请求
-(void)CancelRequest
{
    if ([type isEqualToString:@"GET"]) {
        [self.HTTPRequest cancel ];
    }else if ([type isEqualToString:@"POST"])
    {
        [self.FormDataRequest cancel];
    }
    
}
-(void)requstImageView:(UIImageView *)imageView ImageURL:(NSString *)imageURL PlaceholderImageName:(NSString *)placeholderImageName
{
    
    [imageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:placeholderImageName] ];
}


@end
