//
//  MJPEGViewController.h
//  RosebudSocket
//
//  Created by Rob Baltzer on 5/19/13.
//  Copyright (c) 2013 Rob Baltzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotionJpegImageView.h"

@interface MJPEGViewController : UIViewController {
    MotionJpegImageView *imageView1;
    MotionJpegImageView *imageView2;
    UIWebView *webView;
}

- (IBAction)buttonExit:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *MJPEGView1;
@property (weak, nonatomic) IBOutlet UIView *MJPEGView2;
@end
