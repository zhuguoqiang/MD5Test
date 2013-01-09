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
    NSString *pass;
    NSString *MD5str;
}
@end

@implementation DHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pass = [[NSString alloc]init];

    
    [self.MD5 addTarget:self action:@selector(encrypt) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


- (void)encrypt
{
    
    NSLog(@"%@",pass);
    const char *cStr = [pass UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    unsigned char resultt[CC_SHA1_DIGEST_LENGTH];
    //MD5加密
    CC_MD5(cStr, StrLength(cStr), result);

    pass = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
    self.MD5pass.text = pass;
    NSLog(@"MD5 encrypt = %@",pass);
    
    //SHA加密
    CC_SHA1(cStr, strlen(cStr), resultt);
    NSString *passSHA = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             resultt[0], resultt[1], resultt[2], resultt[3],
             resultt[4], resultt[5], resultt[6], resultt[7],
             resultt[8], resultt[9], resultt[10], resultt[11],
             resultt[12], resultt[13], resultt[14], resultt[15],
             resultt[16], resultt[17], resultt[18], resultt[19]
             ] uppercaseString];
    
    NSLog(@"SHA encrypt = %@",passSHA);
    
    
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    pass = textField.text;
    NSLog(@"%@",pass);
}

@end
