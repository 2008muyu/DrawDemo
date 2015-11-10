//
//  Toolbar.h
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolbarButtonActionDelegate <NSObject>

- (void)toolbarButtonClickWithIndex:(NSInteger)index;

@end

@interface Toolbar : UIView

- (void)hide;

- (void)show;

@property (nonatomic, weak) id <ToolbarButtonActionDelegate> delegate;

@end
