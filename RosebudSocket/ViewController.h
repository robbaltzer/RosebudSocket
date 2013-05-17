//
//  ViewController.h
//  RosebudSocket
//
//  Created by Rob Baltzer on 4/6/13.
//  Copyright (c) 2013 Rob Baltzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trace.h"
#import "SocketControl.h"

@interface ViewController : UIViewController {
    Trace* trace;
    SocketControl* socketControl;
}
- (IBAction)switchTelnet:(id)sender;

@property (nonatomic, strong) SocketControl* socketControl;
@property (nonatomic, strong) Trace *trace;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UILabel *labelVersion;
@property (weak, nonatomic) IBOutlet UILabel *labelIPAddress;
@property (weak, nonatomic) IBOutlet UITextView *textViewTrace;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchTelnet;

@end
