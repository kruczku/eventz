//
//  EventsListViewController.m
//  Eventz
//
//  Created by Kamil Debowski on 1/8/15.
//  Copyright (c) 2015 Rafał Mańka. All rights reserved.
//

#import "EventsPagerViewController.h"

@interface EventsPagerViewController ()

@end

@implementation EventsPagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EventsPagerViewController *eventsList = [[EventsPagerViewController alloc] init];
    
    NSURL *jsonURL = [NSURL URLWithString:@"http://json.rafalmanka.pl/proh/conferences"];
    [eventsList getJSONData:jsonURL];
    NSDictionary *conferences = [[eventsList events] dictionaryWithValuesForKeys:@[@"konferencje"]];
    self.ConferencesList = [[NSMutableArray alloc] init];
    if ([[conferences allValues] count] > 0)
    {
        
        for (int i = 0 ; i < [[[conferences allValues]objectAtIndex:0] count]; i++)
        {
            [self.ConferencesList addObject: [[Conference alloc] initWithDictionary:[[[conferences allValues] objectAtIndex:0] objectAtIndex:i]]];
        }
    }
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConferenceListController"];
    self.pageViewController.dataSource = self;
    
    
    ConferenceContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControlers = @[startingViewController];
    
    [self.pageViewController setViewControllers:viewControlers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) getJSONData:(NSURL*)jsonURL {
    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:jsonURL];
    [self setEvents:[NSJSONSerialization JSONObjectWithData:jsonFile options:NSJSONReadingMutableContainers error:nil]];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ConferenceContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ConferenceContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.ConferencesList count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (ConferenceContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.ConferencesList count] == 0) || (index >= [self.ConferencesList count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    ConferenceContentViewController *conferenceContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConferenceContentViewController"];
    
    conferenceContentViewController.DataContext = [self.ConferencesList objectAtIndex:index];
    conferenceContentViewController.pageIndex = index;
    return conferenceContentViewController;
}

@end
