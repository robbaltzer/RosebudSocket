//
//  AppDelegate.h
//  RosebudSocket
//
//  Created by Rob Baltzer on 4/6/13.
//  Copyright (c) 2013 Rob Baltzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trace.h"
#import "SocketControl.h"

typedef enum {
    socketModeTelnet = 0,
    socketModeBinary = 1,
} SocketMode;

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    Trace* trace;
    SocketControl* socketControl;
    SocketMode socketMode;
}

@property (nonatomic, strong) SocketControl* socketControl;
@property (nonatomic, strong) Trace *trace;
@property (strong, nonatomic) UIWindow *window;
@property SocketMode socketMode;
@end
