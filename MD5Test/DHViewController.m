//
//  DHViewController.m
//  MD5Test
//
//  Created by 朱国强 on 13-1-9.
//  Copyright (c) 2013年 Apple002. All rights reserved.
//

#import "DHViewController.h"

#import "CommonCrypto/CommonDigest.h"

@interface DHViewController ()
{
    NSString *_strPass;
}
@end

@implementation DHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self.btnEencrypt addTarget:self
                         action:@selector(btnEencryptAction:)
           forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Private
- (void)btnEencryptAction:(id)sender
{
    _strPass = self.tfInput.text;
    if (nil != _strPass)
    {
        NSString *strMD5Output = [self md5:_strPass];
        
        self.lbMD5EncryptOutput.text = strMD5Output;
        
        NSString *strSHA1Output = [self sha1:_strPass];
        
        self.lbSHA1EncryptOutput.text = strSHA1Output;
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入要加密的数据" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
    }

    
}

#pragma mark - Encrypt
//MD5加密
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, strlen(cStr), result);
    
    NSString *md5 = [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    return md5;
}

//SHA1加密 小写
- (NSString *)sha1:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char resultt[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(cStr, strlen(cStr), resultt);
    NSString *sha1  = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                            resultt[0], resultt[1], resultt[2], resultt[3],
                            resultt[4], resultt[5], resultt[6], resultt[7],
                            resultt[8], resultt[9], resultt[10], resultt[11],
                            resultt[12], resultt[13], resultt[14], resultt[15],
                            resultt[16], resultt[17], resultt[18], resultt[19]
                            ] lowercaseString];
    return sha1;
}

#pragma mark -  UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
        {
            //Nothing
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITouch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if ([self.tfInput isFirstResponder])
    {
        [self.tfInput resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _strPass = textField.text;
}

@end
