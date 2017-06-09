
//
//  UWShareManager.m
//  uworks-library
//
//  Created by 陈亚勃 on 2017/5/2.
//  Copyright © 2017年 Sheldon. All rights reserved.
//

#import "UWShareManager.h"

@implementation UWShareManager

+ (void)shareWithMessage:(NSString *)message
                thumImage:(id)thumImage
                   title:(NSString *)title
                  webURL:(NSString *)webURL
   currentViewController:(id)currentViewController
              completion:(UMSocialRequestCompletionHandler)block{
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象

        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:message thumImage:thumImage];
        //设置网页地址
        shareObject.webpageUrl = webURL;
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:currentViewController completion:block];

        // 根据获取的platformType确定所选平台进行下一步操作
    }];
    
}
@end
