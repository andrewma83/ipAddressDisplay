//
//  ViewController.h
//  ipAddressDisplay
//
//  Created by Andrew Ma on 11/23/13.
//  Copyright (c) 2013 Andrew Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UILabel *_privateIP;
    UILabel *_netmask;
    UILabel *_globalIP;
    NSDictionary *jsonDict;
}

@property (nonatomic) IBOutlet UILabel *privateIP;
@property (nonatomic) IBOutlet UILabel *netmask;
@property (nonatomic) IBOutlet UILabel *globalIP;
@end
