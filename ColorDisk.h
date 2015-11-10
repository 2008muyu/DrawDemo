//
//  ColorDisk.h
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorDiskDelegate <NSObject>

- (void)didChooseColor:(UIColor*)color;

@end

@interface ColorDisk : UIView <UICollectionViewDataSource, UICollectionViewDelegate>

+ (ColorDisk*)sharedInstance;

@property (nonatomic, weak) id <ColorDiskDelegate> delegate;

@end
