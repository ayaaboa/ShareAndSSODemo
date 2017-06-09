//
//  ViewController.m
//  UWShareSingleAndSignOn
//
//  Created by 陈亚勃 on 2017/4/26.
//  Copyright © 2017年 cyb. All rights reserved.
//

#import "ViewController.h"

#import "UWShareManager.h"
#import "UWSingleSignOnManager.h"

#import <UMengUShare/UShareUI/UShareUI.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *platform;
@property (weak, nonatomic) IBOutlet UILabel *uid;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareAction:(id)sender {
    
    [UWShareManager shareWithMessage:@"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！"
                           thumImage:@"https://mobile.umeng.com/images/pic/home/social/img-1.png"
                               title:@"欢迎使用【友盟+】社会化组件U-Share"
                              webURL:@"http://mobile.umeng.com/social"
               currentViewController:self
                          completion:^(id result, NSError *error) {
                              if (error) {
                                  UMSocialLogInfo(@"************Share fail with error %@*********",error);
                              }else{
                                  if ([result isKindOfClass:[UMSocialShareResponse class]]) {
                                      UMSocialShareResponse *resp = result;
                                      //分享结果消息
                                      UMSocialLogInfo(@"response message is %@",resp.message);
                                      //第三方原始返回的数据
                                      UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                                      
                                      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                                     message:@"分享成功"
                                                                                              preferredStyle:UIAlertControllerStyleAlert];
                                      UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                                           
                                                                                       }];
                                      [alert addAction:action];
                                      
                                      [self presentViewController:alert animated:YES completion:nil];
                                      
                                      
                                  }else{
                                      UMSocialLogInfo(@"response data is %@",result);
                                  }
                              }
                          }];
    

    
}

/*分享内容根据实际情况自己设置
 
 分享目前支持的类型有：
 
 网页类型（网页链接）
 
 图片
 
 文本
 
 表情（GIF图片，即Emotion类型，只有微信支持）
 
 图文（包含一张图片和一段文本）
 
 视频（只支持视频URL、缩略图及描述）
 
 音乐（只支持音乐URL、缩略图及描述）
 
 */


- (IBAction)qqlogin:(id)sender {
    [UWSingleSignOnManager qqSignOnCurrentViewController:self completion:^(id result, NSError *error) {
        if (!error){
            [self handelSSOResult:result];
        }
    }];
}

- (IBAction)wechatlogin:(id)sender {
    [UWSingleSignOnManager wechatSignOnCurrentViewController:self completion:^(id result, NSError *error) {
        if (!error){
            [self handelSSOResult:result];
        }
    }];
}

- (IBAction)sinalogin:(id)sender {
    [UWSingleSignOnManager sinaSignOnCurrentViewController:self completion:^(id result, NSError *error) {
        if (!error){
            [self handelSSOResult:result];
        }
    }];
}

- (void)handelSSOResult:(id)result{
    UMSocialUserInfoResponse *resp = result;
    
    // 第三方登录数据(为空表示平台未提供)
    // 授权数据
    self.uid.text = resp.uid;
    self.nickname.text = resp.name;
    
    NSLog(@" uid: %@", resp.uid);
    NSLog(@" openid: %@", resp.openid);
    NSLog(@" accessToken: %@", resp.accessToken);
    NSLog(@" refreshToken: %@", resp.refreshToken);
    NSLog(@" expiration: %@", resp.expiration);
    
    // 用户数据
    NSLog(@" name: %@", resp.name);
    NSLog(@" iconurl: %@", resp.iconurl);
    NSLog(@" gender: %@", resp.gender);
    
    // 第三方平台SDK原始数据
    NSLog(@" originalResponse: %@", resp.originalResponse);
}

@end
