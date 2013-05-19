//
//  ViewController.m
//  RosebudSocket
//
//  Created by Rob Baltzer on 4/6/13.
//  Copyright (c) 2013 Rob Baltzer. All rights reserved.
//

#import <ifaddrs.h>
#import <arpa/inet.h>
#import "ViewController.h"
#import "AppDelegate.h"

#define DEFAULT_PORT 8377

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelVersion, labelIPAddress, socketControl, trace;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    
    [labelVersion setText:appVersion];
    [self.labelIPAddress setText:[self getIPAddress]];
    trace = ApplicationDelegate.trace;
    socketControl = ApplicationDelegate.socketControl;
    [trace setTextView: self.textViewTrace];
    [trace clear];
    [trace update];
    [trace trace:@"Trace up and running"];
    [socketControl setPort:DEFAULT_PORT];
    [socketControl rxStartServer];
    ApplicationDelegate.socketMode = (SocketMode) self.switchTelnet.selectedSegmentIndex;

    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon-Small-50.png"]];
    [self.MJPEGView addSubview:imgView];
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 640.0, 480.0)];
    webView.userInteractionEnabled = NO;
    CGFloat scaleRatio = self.MJPEGView.bounds.size.width / webView.bounds.size.width;
    scaleRatio = 0.5F;
    CGAffineTransform scalingTransform = CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
    [webView setTransform:scalingTransform];
    CGRect webFrame = webView.frame;
    webFrame.origin.y = 0.0;
    webFrame.origin.x = 0.0;
    webView.frame = webFrame;
    
    NSURL *url = [NSURL URLWithString:@"http://204.248.124.202/mjpg/video.mjpg"];
    
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    [webView loadRequest:request];
    //    [self.MJPEGView addSubview:webView];
    
    //    webFrame.origin.y += webFrame.size.height;
    imageView = [[MotionJpegImageView alloc] initWithFrame:webFrame];
    imageView.url = url;
    [self.MJPEGView addSubview:imageView];
    [imageView play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Get IP Address
- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en1"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
                else if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}

- (IBAction)switchTelnet:(id)sender {
        ApplicationDelegate.socketMode = (SocketMode) self.switchTelnet.selectedSegmentIndex;
        NSLog(@"%d",self.switchTelnet.selectedSegmentIndex);
}
@end
