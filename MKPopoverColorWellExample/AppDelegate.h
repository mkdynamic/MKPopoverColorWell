//
//  AppDelegate.h
//  MKPopoverColorWellExample
//
//  Created by Mark Dodwell on 6/22/12.
//  Copyright (c) 2012 mkdynamic. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property IBOutlet NSColorWell *wellA;
@property IBOutlet NSColorWell *wellB;

- (IBAction)testAction:(id)sender;

@end
