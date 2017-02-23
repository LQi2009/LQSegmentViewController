//
//  LDSegmentCell.h
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/18.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDSegmentCell : UICollectionViewCell

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, assign) CGFloat fontSize;
@end

// 类内部使用的Model
@interface LDSegmentModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) CGFloat fontSize;
@end
