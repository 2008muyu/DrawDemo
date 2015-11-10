//
//  ToolbarButtonModel.m
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "ToolbarButtonModel.h"


CGFloat m_width() {
    return (SCREEN_WIDTH-((lineNumber-1)*edge))/lineNumber;
}

CGFloat m_height() {
    return (SCREEN_WIDTH-((lineNumber-1)*edge))/lineNumber;
}

@interface ToolbarButtonModel ()

@property (nonatomic, strong) NSMutableSet* xSet;

@end

@implementation ToolbarButtonModel

- (instancetype)init
{
    return [self initWithIndex:0];
}

- (instancetype)initWithIndex:(NSInteger)index
{
    self = [super init];
    if (self) {
        self.index = index;
        [self xSet];
        self.frame = CGRectMake([self getX], 0, m_width(), m_height());
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGFloat)getX {
    NSArray* xArray = [_xSet allObjects];
    NSNumber* x = xArray[_index];
    return [x integerValue];
}

#pragma mark property method

- (void)setIndex:(NSInteger)index {
    _index = index;
}

- (NSMutableSet *)xSet {
    if (!_xSet) {
        _xSet = [[NSMutableSet alloc] init];
        for (int i = 0; i < lineNumber; i++) {
            NSNumber* x = @((m_width()+edge)*i);
            [_xSet addObject:x];
        }
    }
    return _xSet;
}

@end
