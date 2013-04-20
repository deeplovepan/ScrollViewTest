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



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.testScrollView.contentSize = CGSizeMake(320*4, [UIScreen mainScreen].bounds.size.height - 20);
    self.testScrollView.pagingEnabled = YES;
    int i;
    for(i=0;i<4;i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*i, 0, 320,
                                                                  [UIScreen mainScreen].bounds.size.height - 20)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSString *name = [NSString stringWithFormat:@"baby%d.png", i];
        imageView.image = [UIImage imageNamed:name];
        [self.testScrollView addSubview:imageView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
