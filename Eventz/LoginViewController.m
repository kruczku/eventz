//
//  ViewController.m
//  Eventz
//
//  Created by Rafał Mańka on 12/18/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import "LoginViewController.h"
#import "UserService.h"
#import "UIUtils.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

UserService *userService;

- (UserService *) getUserService{
    if(!userService){
        userService = [[UserService alloc] init:self];
    }
    return userService;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // setup login button
    [self setupLoginButton];
    //setup login text field
    UITextField *loginTF = [self tfLogin];
    [self setupTextField:loginTF];
    //setup password textfield
    UITextField *passwordTF = [self tfPassword];
    [self setupTextField:passwordTF];
}

/*
 Checks if login and password are in correct format
 */
- (IBAction)clickLoginButton:(id)sender {
    
    NSString *login = [self.tfLogin text];
    UserService *service = [self getUserService];
    BOOL isCorrectLogin = [service isValidLogin:login];
    if(!isCorrectLogin){
        [UIUtils showAlert:@"Niepoprawny login. Musisz podać cały adres email." forTitle:@"Błędny login" andCancelButton:@"OK"];
        return;
    }
    
    NSString *password = [self.tfPassword text];
    BOOL isCorrectPassword = [service isValidPassword:password];
    if(!isCorrectPassword){
        [UIUtils showAlert:@"hasło musi składać się z przynajmniej 5 znaków." forTitle:@"Niepoprawne hasło" andCancelButton:@"OK"];
        return;
    }
    
    [service startRequestLogin:login withPassword:password];
    
}

- (void)didLoginUser:(User*)user{
    NSLog(@"%@", user);
    [UIUtils showAlert:@"Now I have to segue to next view" forTitle:@"Great!" andCancelButton:@"move on"];
    
}

/*
 Styles login button to have round edges and dark green border
 */
- (void) setupLoginButton{
    UIButton* btn = [self btnLogin];
    btn.frame = CGRectMake(100, 100, 100,50);
    btn.frame = CGRectMake(100.0, 100.0, 120.0, 50.0);
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 7;
    btn.layer.borderWidth=1.0f;
    btn.layer.borderColor=[UIColor colorWithRed:18.0/255.0f green:77.0/255.0f  blue:18.0/255.0f alpha:0.7].CGColor;
}


/*
 Styles input fields to have darker round border and hint (placeholder).
 */
- (void) setupTextField:(UITextField *) textField {
    UIColor *grayColor = [UIColor colorWithRed:122.0/255.0f green:122.0/255.0f  blue:122.0/255.0f alpha:0.7];
    
    textField.layer.borderColor = grayColor.CGColor;
    textField.layer.cornerRadius = 7;
    textField.layer.borderWidth=1.0;
    
    [textField setValue:grayColor forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
