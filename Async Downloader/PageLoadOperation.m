//
//  PageLoadOperation.m
//  Async Downloader
//
//  Created by Matt Long on 2/16/08.
//  Copyright 2008 Cocoa Is My Girlfriend. All rights reserved.
//

#import "PageLoadOperation.h"
#import "AppDelegate.h"

@implementation PageLoadOperation

@synthesize targetURL;
 
- (id)initWithURL:(NSURL*)url;
{
    if (![super init]) return nil;
    [self setTargetURL:url];
    return self;
}
 
- (void)dealloc {
    [targetURL release], targetURL = nil;
    [super dealloc];
}
 
- (void)main {
    NSString *webpageString = [[[NSString alloc] initWithContentsOfURL:[self targetURL]] autorelease];

    NSError *error = nil;
    NSXMLDocument *document = [[NSXMLDocument alloc] initWithXMLString:webpageString 
                                                              options:NSXMLDocumentTidyHTML 
                                                                error:&error];
    if (!document) {
        NSLog(@"%s Error loading document (%@): %@", _cmd, [[self targetURL] absoluteString], error);
        return;
    }	
	
    [[AppDelegate shared] performSelectorOnMainThread:@selector(pageLoaded:)
                                           withObject:document
                                        waitUntilDone:NO];
}
 
@end
