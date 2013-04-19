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
    self.testScrollView.contentSize = CGSizeMake(320*3, 460*3);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 1014, 762)];
    imageView.image = [UIImage imageNamed:@"book.jpg"];
    [self.testScrollView addSubview:imageView];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:
                            CGRectMake(350, 500, 220, 100)];
    textView.text = @"希臘英雄也會寫App\n寫App的果然都是英雄";
    textView.font = [UIFont systemFontOfSize:20];
    [self.testScrollView addSubview:textView];
    textView.scrollsToTop = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
