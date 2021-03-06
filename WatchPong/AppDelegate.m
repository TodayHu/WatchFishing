//
//  AppDelegate.m
//  WatchPong
//
//  Created by Calvin Tham on 4/4/15.
//  Copyright (c) 2015 Calvin Tham. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply {
    NSLog(@"FOUND");
    NSString* press = [userInfo objectForKey:@"press"];
    if([press isEqualToString:@"left"])
    {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"press_left"
         object:self];
    }
    if([press isEqualToString:@"right"])
    {
        NSLog(@"PRESSED RIGHT");
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"press_right"
         object:self];
    }
    if([press isEqualToString:@"cast"])
    {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"press_cast"
         object:self];
    }
    if([press isEqualToString:@"reel"])
    {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"press_reel"
         object:self];
    }
    
    //look at the userInfo dictionary to figure out why we're being called
    //do some stuff
    //send back a dictionary of data to the watchkit extension
    reply(@{@"numberOfUsers": @(5)});
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
