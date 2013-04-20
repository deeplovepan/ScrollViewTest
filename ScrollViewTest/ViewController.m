//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Peter Pan on 4/19/13.
//  Copyright (c) 2013 Peter Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    UIImageView *imageView;
}

@property (weak, nonatomic) IBOutlet UIScrollView *testScrollView;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320,
                                        [UIScreen mainScreen].bounds.size.height - 20)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"book.jpg"];
    [self.testScrollView addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

@end
