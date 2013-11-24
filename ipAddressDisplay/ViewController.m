//
//  ViewController.m
//  ipAddressDisplay
//
//  Created by Andrew Ma on 11/23/13.
//  Copyright (c) 2013 Andrew Ma. All rights reserved.
//
#include <ifaddrs.h>
#include <arpa/inet.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (NSArray *)getIPAddress {
    NSArray *retval;
    NSString *address = @"error";
    NSString *netmask = @"error";
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
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    netmask = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_netmask)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    retval = @[address, netmask];
    return retval;
}

-(void)timer:(id) userInfo
{
    NSArray *result = [self getIPAddress];
    [_ipAddress setText:result[0]];
    [_netmask setText:result[1]];
}

-(void)viewDidAppear:(BOOL)animated
{
    NSArray *result = [self getIPAddress];
    [_ipAddress setText:result[0]];
    [_netmask setText:result[1]];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(timer:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
