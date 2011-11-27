//
//  AAViewController.m
//  Test
//
//  Created by Georg Kitz on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AAViewController.h"
#import "AASegmentControl.h"

@implementation AAViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)setupSegmentControlWithTwoSegments{
    AASegmentControl *segmentControl = [[[AASegmentControl alloc] initWithFrame:CGRectMake(0, 0, 300, 33)] autorelease];
    segmentControl.items = [NSArray arrayWithObjects:@"left", @"right", nil];
    segmentControl.selectedIndex = 0;
    [segmentControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIImage *leftImageOn = [[UIImage imageNamed:@"seg_controller_left_half_on"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImage *leftImageOff = [[UIImage imageNamed:@"seg_controller_left_half_off"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [segmentControl setImage:leftImageOn forState:UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled controlSegment:ControlSegmentLeft];
    [segmentControl setImage:leftImageOff forState:UIControlStateNormal controlSegment:ControlSegmentLeft];
    
    UIImage *rightImageOn = [[UIImage imageNamed:@"seg_controller_right_half_on"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImage *rightImageOff = [[UIImage imageNamed:@"seg_controller_right_half_off"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [segmentControl setImage:rightImageOn forState:UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled controlSegment:ControlSegmentRight];
    [segmentControl setImage:rightImageOff forState:UIControlStateNormal controlSegment:ControlSegmentRight];
    
    UIBarButtonItem *custom = [[[UIBarButtonItem alloc] initWithCustomView:segmentControl] autorelease];
    custom.width = 300;
    UIBarButtonItem *flex = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    
    UIToolbar *bar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 60, 320, 44)] autorelease];
    bar.items = [NSArray arrayWithObjects:flex, custom, flex, nil];
    [self.view addSubview:bar];
}

- (void)setupSegmentControlWithThreeSegments{
    AASegmentControl *segmentControl = [[[AASegmentControl alloc] initWithFrame:CGRectMake(0, 0, 300, 33)] autorelease];
    segmentControl.items = [NSArray arrayWithObjects:@"left", @"middle", @"right", nil];
    segmentControl.selectedIndex = 1;
    [segmentControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIImage *leftImageOn = [[UIImage imageNamed:@"seg_controller_left_thirds_on"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImage *leftImageOff = [[UIImage imageNamed:@"seg_controller_left_thirds_off"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [segmentControl setImage:leftImageOn forState:UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled controlSegment:ControlSegmentLeft];
    [segmentControl setImage:leftImageOff forState:UIControlStateNormal controlSegment:ControlSegmentLeft];
    
    UIImage *middleImageOn = [[UIImage imageNamed:@"seg_controller_mid_thirds_on"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImage *middleImageOff = [[UIImage imageNamed:@"seg_controller_mid_thirds_off"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [segmentControl setImage:middleImageOn forState:UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled controlSegment:ControlSegmentMiddle];
    [segmentControl setImage:middleImageOff forState:UIControlStateNormal controlSegment:ControlSegmentMiddle];
    
    UIImage *rightImageOn = [[UIImage imageNamed:@"seg_controller_right_thirds_on"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImage *rightImageOff = [[UIImage imageNamed:@"seg_controller_right_thirds_off"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    [segmentControl setImage:rightImageOn forState:UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled controlSegment:ControlSegmentRight];
    [segmentControl setImage:rightImageOff forState:UIControlStateNormal controlSegment:ControlSegmentRight];
    
    UIBarButtonItem *custom = [[[UIBarButtonItem alloc] initWithCustomView:segmentControl] autorelease];
    custom.width = 300;
    UIBarButtonItem *flex = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
    
    UIToolbar *bar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, 140, 320, 44)] autorelease];
    bar.items = [NSArray arrayWithObjects:flex, custom, flex, nil];
    [self.view addSubview:bar];
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setupSegmentControlWithTwoSegments];
    [self setupSegmentControlWithThreeSegments];
}

- (void)valueChanged:(id)sender{
    AASegmentControl *ctr = (AASegmentControl *)sender;
    NSLog(@"Selected Index %d", ctr.selectedIndex);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
