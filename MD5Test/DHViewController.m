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
    
}
@end

@implementation DHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pass = [[NSString alloc]init];
   

    
    [self.encrypt addTarget:self action:@selector(encryptBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


- (void)encryptBtn
{
    
    NSString *md5pass = [self md5:pass];
    NSLog(@"%@",md5pass);
    
    const char *cStr = [pass UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    unsigned char resultt[CC_SHA1_DIGEST_LENGTH];
    
    //MD5加密
//    CC_MD5(cStr, StrLength(cStr), result);//    StrLength  strlen     区别？？？？？
    CC_MD5(cStr, strlen(cStr), result);

    NSString *md5str = [NSString stringWithFormat:
                        
                        @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        
                        result[0], result[1], result[2], result[3],
                        
                        result[4], result[5], result[6], result[7],
                        
                        result[8], result[9], result[10], result[11],
                        
                        result[12], result[13], result[14], result[15]
                        
                        ];

    self.MD5pass.text = md5str;
    



   
    
    //SHA加密
    CC_SHA1(cStr, strlen(cStr), resultt);
    self.SHA1pass.text  = [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             resultt[0], resultt[1], resultt[2], resultt[3],
             resultt[4], resultt[5], resultt[6], resultt[7],
             resultt[8], resultt[9], resultt[10], resultt[11],
             resultt[12], resultt[13], resultt[14], resultt[15],
             resultt[16], resultt[17], resultt[18], resultt[19]
             ] lowercaseString];
    
    
}

- (NSString *)md5:(NSString *)str

{
    
    const char *cStr = [str UTF8String];
    
    unsigned char result[16];
    
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    
    return [NSString stringWithFormat:
            
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            
            result[0], result[1], result[2], result[3],
            
            result[4], result[5], result[6], result[7],
            
            result[8], result[9], result[10], result[11],
            
            result[12], result[13], result[14], result[15]
            
            ];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    pass = textField.text;
    
    [textField resignFirstResponder];
    
//    [self encryptBtn];
   
}

@end
