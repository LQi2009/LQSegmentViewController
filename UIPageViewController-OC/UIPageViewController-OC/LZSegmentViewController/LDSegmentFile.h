//
//  LDSegmentFile.h
//  UIPageViewController-OC
//
//  Created by Artron_LQQ on 2017/2/18.
//  Copyright © 2017年 Artup. All rights reserved.
//

#ifndef LDSegmentFile_h
#define LDSegmentFile_h

// Hex色值
#define LDColorFromHex(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//R G B 颜色
#define LDColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define LDSCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define LDSCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width

#define LDNavigationBarHeight 64.0
#define LDTabbarHeight 49.0
#endif /* LDSegmentFile_h */
