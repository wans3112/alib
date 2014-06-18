//
//  AVO_ViewController.h
//  AVOSDKTest
//
//  Created by Zhengji Tao on 12/2/13.
//  Copyright (c) 2013 Ramytech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVOClient.h"
#import "AVOKeyManager.h"


@interface AVO_ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) id<AVOClient> client;
@property (nonatomic, retain) id<AVOKeyManager> keyMananger;


- (IBAction)buttonPressed:(id)sender;

@end
