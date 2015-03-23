//
//  SCBMacroDefinition.h
//  SCB
//
//  Created by Liu on 15/3/23.
//  Copyright (c) 2015年 idol_SR. All rights reserved.
//

#ifndef SCB_SCBMacroDefinition_h
#define SCB_SCBMacroDefinition_h
//适配ios6和ios7
#define ISIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])
#define StatusbarSize ((isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
//rgb值
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
//获取屋里屏幕
#define SCREEN [[UIScreen mainScreen] bounds]
//IP地址和端口号
#define IPAndHost @"http://127.0.0.1:8080"

#endif
