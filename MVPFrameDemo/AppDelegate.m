//
//  AppDelegate.m
//  MVPFrameDemo
//
//  Created by keith on 2020/9/10.
//  Copyright © 2020 Charles&Keith. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    return YES;
}

@end
