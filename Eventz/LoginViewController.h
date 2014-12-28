//
//  ViewController.h
//  Eventz
//
//  Created by Rafał Mańka on 12/18/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface LoginViewController : UIViewController <UserDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UITextField *tfLogin;
@property (strong, nonatomic) IBOutlet UITextField *tfPassword;

@end

