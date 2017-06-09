//
//  UWSingleSignOnManager.h
//  UWShareAndSingleSignOn
//
//  Created by 陈亚勃 on 2017/6/9.
//  Copyright © 2017年 cyb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>
@interface UWSingleSignOnManager : NSObject

+ (void)sinaSignOnCurrentViewController:(id)controller
                             completion:(UMSocialRequestCompletionHandler)completion;
+ (void)qqSignOnCurrentViewController:(id)controller
                           completion:(UMSocialRequestCompletionHandler)completion;
+ (void)wechatSignOnCurrentViewController:(id)controller
                               completion:(UMSocialRequestCompletionHandler)completion;

@end

