//
//  UWShareManager.h
//  uworks-library
//
//  Created by 陈亚勃 on 2017/5/2.
//  Copyright © 2017年 Sheldon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMengUShare/UShareUI/UShareUI.h>
/**
 分享manager
 */


@interface UWShareManager : NSObject

+ (void)shareWithMessage:(NSString *)message
                thumImage:(id)thumImage
                   title:(NSString *)title
                  webURL:(NSString *)webURL
   currentViewController:(id)currentViewController
              completion:(UMSocialRequestCompletionHandler)block;

@end
