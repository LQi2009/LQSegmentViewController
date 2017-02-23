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

@interface ViewController ()

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
