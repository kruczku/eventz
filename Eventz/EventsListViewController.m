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
    NSDictionary *conferences = [[eventsList events] dictionaryWithValuesForKeys:@[@"konferencje"]];
    
    UIScrollView *scrollView = [self scrollView];
    UILabel *titleLabel = [self titleLabel];
    UILabel *descriptionLabel = [self descriptionLabel];
    [self setupScrollView:scrollView withConferences:conferences];
    [self initFirstEvent:titleLabel andDescription:descriptionLabel withConferences:conferences];
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
    for (NSDictionary* conference in [conferences valueForKey:@"konferencje"])
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, 20, 300, 30)];
        [button setTitle:[NSString stringWithFormat:[conference  objectForKey:@"temat"]] forState:UIControlStateNormal];
        
        [scrollView addSubview:button];
        x += button.frame.size.width;
    }
    
    scrollView.contentSize = CGSizeMake(x*2, scrollView.frame.size.height);
    scrollView.backgroundColor = [UIColor redColor];
}

- (void) initFirstEvent:(UILabel*)titleLabel andDescription:(UILabel*)descriptionLabel withConferences:(NSDictionary*)conferences {
    NSString *firstEventTitle = [EventsListViewController getFirstEventTitle:conferences];
    titleLabel.text = firstEventTitle;
    NSString *firstEventDescription = [EventsListViewController getFirstEventDescription:conferences];
    descriptionLabel.text = firstEventDescription;
}

+ (NSString*) getFirstEventTitle:(NSDictionary*)conferences {
    NSDictionary *firstElement = [[[conferences allValues] objectAtIndex:0] objectAtIndex:0];
    NSString *title = [firstElement valueForKey:@"temat"];
    return title;
}

+ (NSString*) getFirstEventDescription:(NSDictionary*)conferences {
    NSDictionary *firstElement = [[[conferences allValues] objectAtIndex:0] objectAtIndex:0];
    NSString *description = [firstElement valueForKey:@"opis"];
    return description;
}


@end
