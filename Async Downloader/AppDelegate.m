//
//  AppDelegate.m
//  Async Downloader
//
//  Created by Matt Long on 2/16/08.
//  Copyright 2008 Cocoa Is My Girlfriend. All rights reserved.
//

#import "AppDelegate.h"
#import "PageLoadOperation.h"

@implementation AppDelegate
static AppDelegate *shared;
static NSArray *urlArray;
 
- (id)init
{
    if (shared) {
        [self autorelease];
        return shared;
    }
    if (![super init]) return nil;
 
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@"http://www.google.com"];
    [array addObject:@"http://www.apple.com"];
    [array addObject:@"http://www.yahoo.com"];
    [array addObject:@"http://www.zarrastudios.com"];
    [array addObject:@"http://www.macosxhints.com"];
    urlArray = array;
    [queue setMaxConcurrentOperationCount:2];
    queue = [[NSOperationQueue alloc] init];
    shared = self;
    return self;
}
 
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    for (NSString *urlString in urlArray) {
        NSURL *url = [NSURL URLWithString:urlString];
        PageLoadOperation *plo = [[PageLoadOperation alloc] initWithURL:url];
        [queue addOperation:plo];
        [plo release];
    }
}

- (void)dealloc
{
    [queue release], queue = nil;
    [super dealloc];
}
 
+ (id)shared;
{
    if (!shared) {
        [[AppDelegate alloc] init];
    }
    return shared;
}
 
- (void)pageLoaded:(NSXMLDocument*)document;
{
    NSLog(@"%s Do something with the XMLDocument: %@", _cmd, document);
}

@end
