//
//  ViewController.h
//  ipAddressDisplay
//
//  Created by Andrew Ma on 11/23/13.
//  Copyright (c) 2013 Andrew Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UILabel *_ipAddress;
    UILabel *_netmask;
    UILabel *_gateway;
}

@property (nonatomic) IBOutlet UILabel *ipAddress;
@property (nonatomic) IBOutlet UILabel *netmask;
@property (nonatomic) IBOutlet UILabel *gateway;
@end
