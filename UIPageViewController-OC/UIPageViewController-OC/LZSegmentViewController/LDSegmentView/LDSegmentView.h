//
//  LDSegmentView.h
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/17.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LDSegmentViewDelagate;

typedef void(^segmentBlock)(NSInteger index);
@interface LDSegmentView : UIView

@property (nonatomic, weak) id <LDSegmentViewDelagate> delegate;
@property (nonatomic, strong) NSArray<NSString *> *datas;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, assign) CGFloat fontSize;

+ (instancetype)segmentViewWithDatas:(NSArray<NSString *> *)datas ;

- (void)setSelectedIndex:(NSInteger)selectedIndex animation:(BOOL)animation ;
- (void)reloadData ;

- (void)selectedIndexWithBlock:(segmentBlock)block ;
@end

@protocol LDSegmentViewDelagate <NSObject>

- (void)segmentView:(LDSegmentView *)view didSelectedIndex:(NSInteger)index ;
@end


///************************************************************************************************************************************************
#pragma LDSegmentCell
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
