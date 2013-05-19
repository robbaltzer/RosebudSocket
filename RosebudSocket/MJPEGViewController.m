//
//  MJPEGViewController.m
//  RosebudSocket
//
//  Created by Rob Baltzer on 5/19/13.
//  Copyright (c) 2013 Rob Baltzer. All rights reserved.
//

#import "MJPEGViewController.h"

@interface MJPEGViewController ()

@end

@implementation MJPEGViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 640.0, 480.0)];
    webView.userInteractionEnabled = NO;
    CGFloat scaleRatio = self.MJPEGView1.bounds.size.width / webView.bounds.size.width;
    scaleRatio = 0.5F;
    CGAffineTransform scalingTransform = CGAffineTransformScale(CGAffineTransformIdentity, scaleRatio, scaleRatio);
    [webView setTransform:scalingTransform];
    CGRect webFrame = webView.frame;
    webFrame.origin.y = 0.0;
    webFrame.origin.x = 0.0;
    webView.frame = webFrame;
    
    NSURL *url1 = [NSURL URLWithString:@"http://204.248.124.202/mjpg/video.mjpg"];
    
        NSURL *url2 = [NSURL URLWithString:@"http://92.66.4.219:8080/mjpg/video.mjpg?camera=1"];
    
    
    
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    [webView loadRequest:request];
    //    [self.MJPEGView addSubview:webView];
    
    //    webFrame.origin.y += webFrame.size.height;
    imageView1 = [[MotionJpegImageView alloc] initWithFrame:webFrame];
    imageView1.url = url1;
    [self.MJPEGView1 addSubview:imageView1];
    [imageView1 play];

    imageView2 = [[MotionJpegImageView alloc] initWithFrame:webFrame];
    imageView2.url = url2;
    [self.MJPEGView2 addSubview:imageView2];
    [imageView2 play];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonExit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
