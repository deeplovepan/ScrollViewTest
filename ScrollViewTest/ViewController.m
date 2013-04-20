//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Peter Pan on 4/19/13.
//  Copyright (c) 2013 Peter Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UIScrollViewDelegate>
{
    int pageCount;
    NSMutableDictionary *pageDic;
}

@property (weak, nonatomic) IBOutlet UIScrollView *testScrollView;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    pageCount = 4;
    pageDic = [[NSMutableDictionary alloc] init];
    self.testScrollView.contentSize = CGSizeMake(320*pageCount, [UIScreen mainScreen].bounds.size.height - 20);
    self.testScrollView.pagingEnabled = YES;
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - page method

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0 || page >= pageCount)
        return;
    else if(pageDic[@(page)] == nil)
    {
        NSLog(@"add page %d", page);

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*page, 0, 320,
                                                [UIScreen mainScreen].bounds.size.height - 20)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSString *name = [NSString stringWithFormat:@"baby%d.png", page];
        imageView.image = [UIImage imageNamed:name];
        [self.testScrollView addSubview:imageView];
        pageDic[@(page)] = imageView;
    }
}

-(void)removeScrollViewWithPage:(int)page
{
    if (page < 0 || page >= pageCount)
        return;
    else if(pageDic[@(page)])
    {
        NSLog(@"remove page %d", page);
        [pageDic[@(page)] removeFromSuperview];
        [pageDic removeObjectForKey:@(page)];
    }
}

#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
   
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    [self removeScrollViewWithPage:page - 2];
    [self removeScrollViewWithPage:page + 2];
}



@end
