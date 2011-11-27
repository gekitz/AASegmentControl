//
//  CustomSegmentControl.h
//  Test
//
//  Created by Georg Kitz on 11/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ControlSegmentLeft = 0,
    ControlSegmentMiddle,
    ControlSegmentRight
}ControlSegment;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*!
 @class       CustomSegmentControl
 @abstract  
 @discussion
 */
@interface AASegmentControl : UIControl {
    NSArray *_items;
    NSMutableArray *_btn;
    
    NSInteger _selectedIndex;
    
    //Style
    UIFont *_font;
    UIColor *_textColor;
    UIColor *_highlightedTextColor;
}

@property (nonatomic, retain) NSArray *items; 
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIColor *highlightedTextColor;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void)setImage:(UIImage *)image forState:(UIControlState)state controlSegment:(ControlSegment)segment;

@end
