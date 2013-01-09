//
//  DHViewController.h
//  MD5Test
//
//  Created by 朱国强 on 13-1-9.
//  Copyright (c) 2013年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *password;

@property (strong, nonatomic) IBOutlet UIButton *MD5;

@property (strong, nonatomic) IBOutlet UILabel *MD5pass;

@end
