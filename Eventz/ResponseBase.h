//
//  ResponseBase.h
//  Eventz
//
//  Created by Rafał Mańka on 12/27/14.
//  Copyright (c) 2014 Rafał Mańka. All rights reserved.
//

#ifndef Eventz_ResponseBase_h
#define Eventz_ResponseBase_h
#endif

#import "JSONModel.h"

@interface ResponseBase : JSONModel

@property (nonatomic, assign) int code;
@property (nonatomic, assign) NSString* message; 

@end