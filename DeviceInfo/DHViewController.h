//
//  DHViewController.h
//  DeviceInfo
//
//  Created by binaryboy on 6/6/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DHViewController : UIViewController  <MFMailComposeViewControllerDelegate> // Add the delegate
- (IBAction)showEmail:(id)sender;

@end
