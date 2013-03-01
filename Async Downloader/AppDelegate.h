//
//  AppDelegate.h
//  Async Downloader
//
//  Created by Matt Long on 2/16/08.
//  Copyright 2008 Cocoa Is My Girlfriend. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppDelegate : NSObject {
	NSOperationQueue *queue;
}

+ (id)shared;
- (void)pageLoaded:(NSXMLDocument*)document;

@end
