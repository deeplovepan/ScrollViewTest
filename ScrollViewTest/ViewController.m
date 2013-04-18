//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Peter Pan on 4/19/13.
//  Copyright (c) 2013 Peter Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIScrollView *testScrollView;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.testScrollView setContentOffset:CGPointMake(150, 250)
                                 animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.testScrollView.contentSize = CGSizeMake(320*3, 460*3);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320*2, 460*2)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"book.jpg"];
    [self.testScrollView addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
