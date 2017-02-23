//
//  LDSegmentCell.m
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/18.
//  Copyright © 2017年 Artup. All rights reserved.
//

#import "LDSegmentCell.h"

static CGFloat __fontSize = 12.0;
@interface LDSegmentCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation LDSegmentCell
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_titleLabel];
    }
    
    return _titleLabel;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    
    self.titleLabel.textColor = isSelected ? _selectedColor : _normalColor;
}
- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    __fontSize = fontSize;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _selectedColor = [UIColor redColor];
        _normalColor = [UIColor whiteColor];
        _fontSize = 12.0;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.backgroundColor = self.backgroundColor;
    self.titleLabel.frame = self.bounds;
}
@end


@implementation LDSegmentModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _selected = NO;
        _fontSize = 12.0;
    }
    
    return self;
}

- (CGFloat)width {
    if (_width <= 0) {
        CGFloat wid = [self.title boundingRectWithSize:CGSizeMake(0, 30) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:self.fontSize]} context:nil].size.width;
        
        _width = wid + 10;
    }
    
    return _width;
}
@end
