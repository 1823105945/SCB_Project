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

@protocol SCBNetworkRequestDelegate <NSObject>
//请求接口的回调


@end
@interface SCBNetworkRequest : NSObject


@property(nonatomic,assign)id<SCBNetworkRequestDelegate>delegate;

@end
