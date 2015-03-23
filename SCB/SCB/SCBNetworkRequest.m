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

+(SCBNetworkRequest *)sharNetWork
{
    if (NetworkRequest==nil) {
        NetworkRequest=[[SCBNetworkRequest alloc]init];
    }
    return NetworkRequest;
}

//GET网络请求接口
-(void)NetworkRequseURL:(NSString *)RequseURLurl RequestParameters:(NSString *)Parameters NetworkRequseType:(NSString *)RequseType
{
    if ([RequseType isEqualToString:@"GET"]) {
        
        __weak ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",IPAndHost,RequseURLurl,Parameters]]];
        [request setCompletionBlock:^{
            NSString *responseSt=[request responseString];
            NSLog(@"%@",responseSt);
        }];
        
        [request setFailedBlock:^{
            NSError *error=[request error];
            NSLog(@"%@",error.userInfo);
        }];
    
    }else
    {
        __weak ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IPAndHost,RequseURLurl]]];
        [[ASIHTTPRequest sharedQueue].cancelAllOperations];
    }
   

}



@end
