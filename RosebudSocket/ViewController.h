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
#import "MotionJpegImageView.h"


@interface ViewController : UIViewController {
    Trace* trace;
    SocketControl* socketControl;
    MotionJpegImageView *imageView1;
    MotionJpegImageView *imageView2;
    UIWebView *webView;

}
- (IBAction)switchTelnet:(id)sender;

@property (nonatomic, strong) SocketControl* socketControl;
@property (nonatomic, strong) Trace *trace;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UILabel *labelVersion;
@property (weak, nonatomic) IBOutlet UILabel *labelIPAddress;
@property (weak, nonatomic) IBOutlet UITextView *textViewTrace;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchTelnet;
@property (strong, nonatomic) IBOutlet UIView *MainView;
@property (weak, nonatomic) IBOutlet UIView *MJPEGView1;
@property (weak, nonatomic) IBOutlet UIView *MJPEGView2;


@end
