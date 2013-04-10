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

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    Trace* trace;
    SocketControl* socketControl;
}

@property (nonatomic, strong) SocketControl* socketControl;
@property (nonatomic, strong) Trace *trace;
//@property (nonatomic, strong) EASessionController* eaSessionController;
//@property (nonatomic, strong) PacketHandler* packetHandler;

@property (strong, nonatomic) UIWindow *window;

@end
