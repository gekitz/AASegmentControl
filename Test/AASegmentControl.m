//
//  CustomSegmentControl.m
//  Test
//
//  Created by Georg Kitz on 11/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AASegmentControl.h"

@interface AASegmentControl()
- (void)initialize;
- (void)setupSegmentControl;
- (void)updateButtonDisplay;

- (void)selectTappedBtn:(id)sender;
- (void)highlightButton:(UIButton *)btn;
@end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation AASegmentControl

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Setter/Getter

@synthesize items = _items;
@synthesize font = _font;
@synthesize textColor = _textColor;
@synthesize highlightedTextColor = _highlightedTextColor;
@synthesize selectedIndex = _selectedIndex;

- (void)setItems:(NSArray *)items{
    [_items release], _items = nil;
    
    _items = [[NSArray arrayWithArray:items] retain];
    [self setupSegmentControl]; 
}

- (void)setFont:(UIFont *)font{
    [_font release], _font = nil;
    
    _font = [font retain];
    [self updateButtonDisplay];
}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor{
    [_highlightedTextColor release], _highlightedTextColor = nil;
    
    _highlightedTextColor = [highlightedTextColor retain];
    [self updateButtonDisplay];
}

- (void)setTextColor:(UIColor *)textColor{
    [_textColor release], _textColor = nil;
    
    _textColor = [textColor retain];
    [self updateButtonDisplay];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex{
    
    NSInteger oldIndex = _selectedIndex;
    _selectedIndex = selectedIndex;
    
    for (NSInteger count = 0; count < [_btn count]; count++) {
        UIButton *btn = [_btn objectAtIndex:count];
        
        if (count == _selectedIndex) {
            btn.selected = btn.highlighted = YES;
        } else {
            btn.selected = btn.highlighted = NO;
        }
    }
    
    if (oldIndex != _selectedIndex) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private Methods

- (void)setupSegmentControl{
    
    if (_btn == nil) {
        _btn = [[NSMutableArray alloc] init];
    }
    
    [_btn removeAllObjects];
    
    for (NSInteger count = 0; count < [_items count]; count++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTag:count + 1];
        [btn setTitle:[_items objectAtIndex:count] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(selectTappedBtn:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(selectTappedBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        //Style
        [btn setTitleColor:_textColor forState:UIControlStateNormal];
        [btn setTitleColor:_highlightedTextColor forState:UIControlStateHighlighted | UIControlStateSelected];
        [[btn titleLabel] setFont:_font];
        
        if (count == _selectedIndex) {
            btn.selected = btn.highlighted = YES;
        }
        
        [self addSubview:btn];
        [_btn addObject:btn];
    }
    
    [self setNeedsLayout];
}

- (void)updateButtonDisplay{
    for (UIButton *btn in _btn) {
        [btn setTitleColor:_textColor forState:UIControlStateNormal];
        [btn setTitleColor:_highlightedTextColor forState:UIControlStateHighlighted | UIControlStateSelected];
        [[btn titleLabel] setFont:_font];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Action Methods 

- (void)selectTappedBtn:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [self performSelector:@selector(highlightButton:) withObject:btn afterDelay:0.0]; 
}

- (void)highlightButton:(UIButton *)btn{
    btn.highlighted = YES;
    btn.selected = YES;
    
    if(_selectedIndex != -1 && _selectedIndex != btn.tag - 1){
        UIButton *lastBtn = [_btn objectAtIndex:_selectedIndex];
        lastBtn.highlighted = NO;
        lastBtn.selected = NO;
    }
    
    NSInteger oldIndex = _selectedIndex;
    _selectedIndex = btn.tag - 1;
    
    if (oldIndex != _selectedIndex) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Initialization

- (id)init {
	if(self = [super init]) {
		// Initialization code
		[self initialize];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _selectedIndex = -1;
    _font = [[UIFont boldSystemFontOfSize:17] retain];
    _textColor = [[UIColor blueColor] retain];
    _highlightedTextColor = [[UIColor yellowColor] retain];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public Methods

- (void)setImage:(UIImage *)image forState:(UIControlState)state controlSegment:(ControlSegment)segment{
    if ([_items count] == 0) {
        return;
    }
    
    switch (segment) {
        case ControlSegmentLeft:{
            UIButton *btn = [_btn objectAtIndex:0];
            [btn setBackgroundImage:image forState:state];
        }break;
        case ControlSegmentRight:{
            UIButton *btn = [_btn objectAtIndex:[_btn count] - 1];
            [btn setBackgroundImage:image forState:state];
        }break;
        case ControlSegmentMiddle:{
            for (NSInteger count = 1; count < [_btn count] - 1; count++) {
                UIButton *btn = [_btn objectAtIndex:count];
                [btn setBackgroundImage:image forState:state];
            }
        }break;
        default:
            break;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Overridden Methods

// Only override layoutSubviews: if it is necessary
// An empty implementation adversely affects performance during animation.
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat segmentWidth = floor(CGRectGetWidth(self.frame) / [_items count]);
    CGFloat segmentHeight = CGRectGetHeight(self.frame);
    
    for (NSInteger count = 0; count < [_items count]; count++) {
        UIButton *btn = [_btn objectAtIndex:count];
        CGRect frame = CGRectMake(0 + count * segmentWidth, 0, segmentWidth, segmentHeight);
        btn.frame = frame;
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	// release your members
    [_highlightedTextColor release];
    [_textColor release];
    [_font release];
    [_btn release];
    [_items release];
	[super dealloc];
}

@end
