//
//  MKColorPickerView.m
//  Color Picker
//
//  Created by Mark Dodwell on 5/26/12.
//  Copyright (c) 2012 mkdynamic. All rights reserved.
//

#import "MKColorSwatchMatrix.h"
#import "MKColorSwatchCell.h"
#import "MKColorWell.h"

@implementation MKColorSwatchMatrix
- (id)initWithFrame:(NSRect)frameRect
       numberOfRows:(NSInteger)rowsHigh 
    numberOfColumns:(NSInteger)colsWide 
             colors:(NSArray *)theColors 
    targetColorWell:(MKColorWell *)aTargetColorWell
{
    colCount = (int)colsWide;
    colors = theColors;
    
    self = [super initWithFrame:frameRect
                           mode:NSTrackModeMatrix 
                      cellClass:[MKColorSwatchCell class] 
                   numberOfRows:rowsHigh 
                numberOfColumns:colsWide];
    
    if (self) {
        targetColorWell = aTargetColorWell;
        
        [self setBackgroundColor:[NSColor darkGrayColor]];
        [self setDrawsBackground:YES];
        
        NSTrackingArea *trackingArea;
        trackingArea = [[NSTrackingArea alloc] initWithRect:[self frame]
                                                    options:(NSTrackingMouseMoved | 
                                                             NSTrackingActiveInKeyWindow |
                                                             NSTrackingMouseEnteredAndExited | 
                                                             NSTrackingInVisibleRect)
                                                      owner:self
                                                   userInfo:nil];
        [self addTrackingArea:trackingArea];
    }
    
    return self;
}

- (NSCell *)makeCellAtRow:(NSInteger)row column:(NSInteger)column
{
    MKColorSwatchCell *cell = (MKColorSwatchCell *)[super makeCellAtRow:row column:column];

    int index = column + (row * colCount);
    
    if (index < [colors count]) {
        cell.color = [colors objectAtIndex:index];
    }
    
    return cell;
}

- (void)mouseDown:(NSEvent *)theEvent
{
    if (highlightedCell) {
        [targetColorWell setColorAndClose:[highlightedCell color]];
    }
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    NSPoint pt = [self convertPoint:[theEvent locationInWindow] fromView:nil];
    
    NSInteger row;
    NSInteger column;
    BOOL hit = [self getRow:&row column:&column forPoint:pt];
    
    if (hit) {
        if (highlightedCell) [highlightedCell setHighlighted:NO];
        highlightedCell = [self cellAtRow:row column:column];
        [highlightedCell setHighlighted:YES];
    }
}

- (void)mouseExited:(NSEvent *)theEvent
{
   highlightedCell = nil;
   [self setNeedsDisplay:YES];
    
}
@end
