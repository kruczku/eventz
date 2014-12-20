//
//  UIUtils.m
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIUtils.h"
#import "LoginViewController.h"

@implementation UIUtils

+ (void) showAlert:(NSString *)message forTitle:(NSString *) title andCancelButton:(NSString *) cancelButton {
  
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelButton
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end