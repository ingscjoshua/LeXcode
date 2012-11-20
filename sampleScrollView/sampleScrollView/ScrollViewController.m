//
//  ScrollViewController.m
//  sampleScrollView
//
//  Created by J05u3 on 18/10/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.scrollView setBackgroundColor:[UIColor blackColor ]];
    [self.scrollView setCanCancelContentTouches:NO];
    self.scrollView.clipsToBounds=YES;
    self.scrollView.scrollEnabled=YES;
    self.scrollView.pagingEnabled=YES;
    
    NSUInteger i;
    for (i=1; i<=4; i++) {
        NSString * nomImg=[NSString stringWithFormat:@"img%d.jpeg",i];
        UIImage * imagen=[UIImage imageNamed:nomImg];
        UIImageView * imagenView=[[UIImageView alloc]initWithImage:imagen];
        CGRect rect=imagenView.frame;
        rect.size.height=275.0;
        rect.size.width=320.0;
        imagenView.frame=rect;
        imagenView.tag=i;
        
        [self.scrollView addSubview:imagenView];
                          
                          
    }
[self imagenScroll];
}
-(void) imagenScroll{
    UIImageView * view=nil;
    NSArray * subViews=[self.scrollView subviews ];
    CGFloat puntoX=0;
    for (view in subViews) {
        if ([view isKindOfClass:[UIImageView class]]&&view.tag>0) {
            CGRect frame = view.frame;
            frame.origin=CGPointMake(puntoX, 0);
            view.frame=frame;
            puntoX+=320.0;
            
        }
    }
    [self.scrollView setContentSize:CGSizeMake(4*320.0, 275.0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
