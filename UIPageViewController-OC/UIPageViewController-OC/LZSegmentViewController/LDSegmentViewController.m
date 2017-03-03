//
//  LDSegmentViewController.m
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/17.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import "LDSegmentViewController.h"
#import "LDSegmentView.h"

@interface LDSegmentViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate, LDSegmentViewDelagate> {
    
    NSInteger ld_currentIndex;
}

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) LDSegmentView *segmentView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation LDSegmentViewController

+ (LDSegmentViewController *)segmentOnViewController:(UIViewController *)viewController childControllers:(NSArray<UIViewController *> *)controllers setmentTitles:(NSArray<NSString *> *)titles ViewFrame:(CGRect)frame {
    
    LDSegmentViewController *segment = [[LDSegmentViewController alloc]init];
    
    segment.view.frame = frame;
    [segment.dataSource addObjectsFromArray:controllers];
    segment.segmentTitles = titles;
    [viewController addChildViewController:segment];
    [viewController.view addSubview:segment.view];
    return segment;
}

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _dataSource;
}

- (LDSegmentView *)segmentView {
    if (_segmentView == nil) {
        _segmentView = [[LDSegmentView alloc]init] ;
        _segmentView.delegate = self;
        _segmentView.fontSize = 12;
        [self.view addSubview:_segmentView];
    }
    
    return _segmentView;
}

- (UIPageViewController *)pageViewController {
    if (_pageViewController == nil) {
        NSDictionary *option = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:10] forKey:UIPageViewControllerOptionInterPageSpacingKey];
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:option];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
    }
    
    return _pageViewController;
}

- (void)setSegmentTitles:(NSArray *)segmentTitles {
    _segmentTitles = segmentTitles;
    self.segmentView.datas = segmentTitles;
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
    
    [self.dataSource addObjectsFromArray:_viewControllers];
}
- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    
    self.segmentView.normalColor = normalColor;
}

- (void)setSelectedColor:(UIColor *)selectedColor {
    _selectedColor = selectedColor;
    
    self.segmentView.selectedColor = selectedColor;
}

- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    
    self.segmentView.fontSize = fontSize;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    self.segmentView.selectedIndex = selectedIndex;
    
    ld_currentIndex = selectedIndex;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSAssert(self.dataSource.count > 0, @"Must have one childViewCpntroller at least");
    NSAssert(self.segmentTitles.count == self.dataSource.count, @"The childViewController's count doesn't equal to the count of segmentTitles");
    
    UIViewController *vc = [self.dataSource objectAtIndex:self.selectedIndex];
    [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    
    self.segmentView.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.view bringSubviewToFront:self.segmentView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ld_currentIndex = 0;
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

- (void)segmentView:(LDSegmentView *)view didSelectedIndex:(NSInteger)index {
    
    UIViewController *vc = [self.dataSource objectAtIndex:index];
    
    if (index > ld_currentIndex) {
        
        [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
            
        }];
    } else {
        
        [self.pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
            
        }];
    }
    
    ld_currentIndex = index;
}
/*
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController  {
    
    return 2;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    
    return 2;
}
*/

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    UIViewController *nextVC = [pendingViewControllers firstObject];
    
    NSInteger index = [self.dataSource indexOfObject:nextVC];
    
    ld_currentIndex = index;
}

// Sent when a gesture-initiated transition ends. The 'finished' parameter indicates whether the animation finished, while the 'completed' parameter indicates whether the transition completed or bailed out (if the user let go early).
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        
        self.segmentView.selectedIndex = ld_currentIndex ;
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
//    [self.segmentView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
