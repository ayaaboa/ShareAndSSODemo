//
//  UWSingleSignOnManager.m
//  UWShareSingleAndSignOn
//
//  Created by 陈亚勃 on 2017/6/9.
//  Copyright © 2017年 cyb. All rights reserved.
//

#import "UWSingleSignOnManager.h"

@implementation UWSingleSignOnManager

+ (void)ssoWithPlatform:(UMSocialPlatformType)platformType
  currentViewController:(id)controller
             completion:(UMSocialRequestCompletionHandler)completion{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:controller completion:completion];
}


+ (void)sinaSignOnCurrentViewController:(id)controller
                             completion:(UMSocialRequestCompletionHandler)completion{
    [UWSingleSignOnManager ssoWithPlatform:UMSocialPlatformType_Sina
                     currentViewController:controller
                                completion:completion];
}

+ (void)qqSignOnCurrentViewController:(id)controller
                           completion:(UMSocialRequestCompletionHandler)completion{
    [UWSingleSignOnManager ssoWithPlatform:UMSocialPlatformType_QQ
                     currentViewController:controller
                                completion:completion];
}

+ (void)wechatSignOnCurrentViewController:(id)controller
                               completion:(UMSocialRequestCompletionHandler)completion{
    [UWSingleSignOnManager ssoWithPlatform:UMSocialPlatformType_WechatSession
                     currentViewController:controller
                                completion:completion];
}

@end
