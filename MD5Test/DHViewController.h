//
//  DHViewController.h
//  MD5Test
//
//  Created by 朱国强 on 13-1-9.
//  Copyright (c) 2013年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *tfInput;

@property (strong, nonatomic) IBOutlet UIButton *btnEencrypt;

@property (strong, nonatomic) IBOutlet UILabel *lbMD5EncryptOutput;

@property (strong, nonatomic) IBOutlet UILabel *lbSHA1EncryptOutput;

@end
