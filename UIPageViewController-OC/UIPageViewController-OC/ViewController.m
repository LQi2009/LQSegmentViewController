//
//  ViewController.m
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/17.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"
#import "LDSegmentViewController.h"
#import "LDSegmentView.h"

@interface ViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
   
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 10; i++) {
        
        ContentViewController *con = [[ContentViewController alloc]init];
        
        [self.dataSource addObject:con];
        
        NSString *str = [NSString stringWithFormat:@"第 %d 页", i+1];
        con.titleStr = str;
        [titles addObject:str];
    }
    
    CGRect frame = self.view.frame;
    frame.origin.y += 64;
    frame.size.height -= 64;
    //LDSegmentViewController *segment = [LDSegmentViewController segmentOnViewController:self childControllers:self.dataSource setmentTitles:titles ViewFrame:frame];
    
    //segment.selectedIndex = 2;
    
    LDSegmentViewController *segVC = [[LDSegmentViewController alloc]init];
    segVC.viewControllers = self.dataSource;
    segVC.segmentTitles = titles;
    segVC.view.frame = frame;
    segVC.selectedIndex = 4;
    [self addChildViewController:segVC];
    [self.view addSubview:segVC.view];
    return;
    
    UIPageViewController *pageView = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    pageView.dataSource = self;
    pageView.delegate = self;
    
    ContentViewController *con = [[ContentViewController alloc]init];
    con.titleStr = @"第 0 页";
    [self.dataSource insertObject:con atIndex:0];
    NSArray *vcs = @[con];
    
    [pageView setViewControllers:vcs direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:pageView];
    [self.view addSubview:pageView.view];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.dataSource indexOfObject:viewController];
    
    if (index == 0 || (index == NSNotFound)) {
        
        return nil;
    }
    
    index--;
    
    
    return [self.dataSource objectAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.dataSource indexOfObject:viewController];
    
    if (index == self.dataSource.count - 1 || (index == NSNotFound)) {
        
        return nil;
    }
    
    index++;
    
    return [self.dataSource objectAtIndex:index];
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController  {
    
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    
    return 2;
}


- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    NSLog(@"willTransitionToViewControllers");
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    NSLog(@"didFinishAnimating");
    
    NSLog(@"%d", completed);
}

/*
// Delegate may specify a different spine location for after the interface orientation change. Only sent for transition style 'UIPageViewControllerTransitionStylePageCurl'.
// Delegate may set new view controllers or update double-sided state within this method's implementation as well.
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation __TVOS_PROHIBITED;

- (UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
- (UIInterfaceOrientation)pageViewControllerPreferredInterfaceOrientationForPresentation:(UIPageViewController *)pageViewController
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
