//
//  SCBNetworkRequest.h
//  SCB
//
//  Created by Liu on 15/3/23.
//  Copyright (c) 2015年 idol_SR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "SCBMacroDefinition.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "ASIDownloadCache.h"
#import "UIImageView+WebCache.h"

@protocol SCBNetworkRequestDelegate <NSObject>
//post接口必须实现此回调 公开ASIFormDataRequest类
-(void)POSTNetworkRequest:(ASIFormDataRequest *)Request;
//post和get请求成功回调
-(void)NetworkRequestSuccess:(NSDictionary *)Dictionary;
//post和get请求失败回调
-(void)NetworkRequestFailure:(NSDictionary *)Dictionary;

@end
@interface SCBNetworkRequest : NSObject
{
    NSString *type;
    ASIDownloadCache *cache;
}
@property(nonatomic,weak)ASIHTTPRequest *HTTPRequest;
@property(nonatomic,weak)ASIFormDataRequest *FormDataRequest;
@property(nonatomic,assign)id<SCBNetworkRequestDelegate>delegate;
//get和post接口

//RequseURLurl
//在post请求是请求的链接
//在get请求是链接加参数

//RequseType为请求类型（POST/GET）
//cachePath是缓存的文件名字（为字符串）
-(void)NetworkRequseURL:(NSString *)RequseURLurl NetworkRequseType:(NSString *)RequseType CachePath:(NSString *)cachePath;
//单利方法
+(SCBNetworkRequest *)sharNetWork;
//取消网络请求
-(void)CancelRequest;
//异步图片加在
//imageView要加载的UIImageView
//imageURL服务器返回的图片url
//placeholderImageName默认图片的名字
-(void)requstImageView:(UIImageView *)imageView ImageURL:(NSString *)imageURL PlaceholderImageName:(NSString *)placeholderImageName;
@end
