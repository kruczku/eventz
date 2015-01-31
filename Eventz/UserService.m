//
//  UserService.m
//  Eventz
//
//  Created by Rafał Mańka on 12/20/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"
#import "StringUtils.h"
#import "UIUtils.h"
#import "ResponseLogin.h"
#import "User.h"

@implementation UserService

NSMutableData *mutableData;
//NSHTTPURLResponse *response;

NSString *endpoint = @"http://eventz-rafalmanka.rhcloud.com/rest/login/auth";

-(id)init:(id) delegate {
    self = [super init];
    self.delegate=delegate;
    return self;
}


- (BOOL) isValidLogin:(NSString *)checkString {
    BOOL isValidEmail = [StringUtils isValidEmail:checkString];
    return isValidEmail;
}

- (BOOL) isValidPassword:(NSString *)checkString {
    BOOL isValidPassword = checkString.length > 5;
    return isValidPassword;
}

- (void) startRequestLogin:(NSString*)login
              withPassword:(NSString*)password {
   
    
    @try{
    mutableData = [[NSMutableData alloc] init];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: [NSString stringWithFormat:endpoint]]];
    
    NSString *post = [NSString stringWithFormat:@"login=%@&password=%@",login,password];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];    
    }
    @catch (NSException* exception){
        NSLog(@"%@", exception.reason);
    }
    
}



-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSHTTPURLResponse *)resp{
    [mutableData setLength:0];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //    NSLog(@"data=%@",data);
    [mutableData appendData:data];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    // If we get any connection error we can manage it here…
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Alert"
                              message:@"No Network Connection"
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK",nil];
    [alertView show];
    
    return;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading" );
    NSString *responseJSON = [[NSString alloc] initWithData: mutableData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Json : %@", responseJSON);
    NSError *err = nil;
    ResponseLogin *resp = [[ResponseLogin alloc] initWithString:responseJSON error:&err];
    NSDictionary *userDictionary = [UserService getUserDataDictionary:resp];
    
    
    if (err == nil) {
        User *user = [[User alloc] initWithResponseData:userDictionary];
        [[self delegate]  didLoginUser:user];
    }else{
        [UIUtils showAlert:@"Login attempt failed" forTitle:@"Nope!" andCancelButton:@"move on"];
        [[self delegate]  didLoginRefused];
    }
    
    
    
    // You can do your functions here. If your repines is in XML you have to parse the response using NSXMLParser. If your response in JSON you have use SBJSON.
}

+ (NSDictionary*) getUserDataDictionary:(ResponseLogin *) responseData
{
    NSDictionary *respDict = [responseData toDictionary];
    return [respDict objectForKey:@"user"];
}

@end