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

        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(320*page, 0, 320, [UIScreen mainScreen].bounds.size.height - 20)];
        scrollView.maximumZoomScale = 2;
        scrollView.delegate = self;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320,
                                                [UIScreen mainScreen].bounds.size.height - 20)];
        [scrollView addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSString *name = [NSString stringWithFormat:@"baby%d.png", page];
        imageView.image = [UIImage imageNamed:name];
        [self.testScrollView addSubview:scrollView];
        pageDic[@(page)] = scrollView;
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

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return scrollView.subviews[0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView == self.testScrollView)
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        [self loadScrollViewWithPage:page - 1];
        [self loadScrollViewWithPage:page];
        [self loadScrollViewWithPage:page + 1];
        
        [self removeScrollViewWithPage:page - 2];
        [self removeScrollViewWithPage:page + 2];
    }
   
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView == self.testScrollView)
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = scrollView.contentOffset.x/pageWidth;
        UIScrollView *imageScrollView = pageDic[@(page-1)];
        imageScrollView.zoomScale = 1;
        imageScrollView = pageDic[@(page+1)];
        imageScrollView.zoomScale = 1;
    }
   
}

@end
