//
//  EventsListViewController.m
//  Eventz
//
//  Created by Kamil Debowski on 1/8/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "EventsListViewController.h"

@interface EventsListViewController ()

@end

@implementation EventsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EventsListViewController *eventsList = [[EventsListViewController alloc] init];
    
    NSURL *jsonURL = [NSURL URLWithString:@"http://json.rafalmanka.pl/proh/conferences"];
    [eventsList getJSONData:jsonURL];
    NSDictionary *conferences = [[eventsList events] valueForKey:@"konferencje"];
    
    UIScrollView *scrollView = [self scrollView];
    [self setupScrollView:scrollView withConferences:conferences];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) getJSONData:(NSURL*)jsonURL {
    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:jsonURL];
    [self setEvents:[NSJSONSerialization JSONObjectWithData:jsonFile options:NSJSONReadingMutableContainers error:nil]];
}

- (void) setupScrollView:(UIScrollView*)scrollView withConferences:(NSDictionary*)conferences {
    
    int x = 0;
    for (NSDictionary* conference in conferences)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 20, 300, 30)];
        [button setTitle:[NSString stringWithFormat:[conference objectForKey:@"temat"]] forState:UIControlStateNormal];
        
        [scrollView addSubview:button];
        x += button.frame.size.width;
    }
    
    scrollView.contentSize = CGSizeMake(x*2, scrollView.frame.size.height);
    scrollView.backgroundColor = [UIColor redColor];
}


@end
