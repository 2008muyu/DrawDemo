//
//  ColorDisk.m
//  DrawDemo
//
//  Created by mby on 15/11/6.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "ColorDisk.h"

@interface ColorDisk ()

@property (nonatomic, strong) NSMutableArray* colorArray;

@end

@implementation ColorDisk


- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self colorArray];
        
        UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
        
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        [self addSubview:collectionView];
        
        
    }
    return self;
}

+ (ColorDisk*)sharedInstance {
    static ColorDisk* _shared = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _shared = [[ColorDisk alloc] init];
    });
    return _shared;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_colorArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identity = @"cell";
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    [cell sizeToFit];
    
    if (!cell) {
        cell = [[UICollectionViewCell alloc] init];
    }
    
    cell.layer.cornerRadius = 1.0f;
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.backgroundColor = _colorArray[indexPath.row];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self setHidden:YES];
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(didChooseColor:)]) {
        [_delegate didChooseColor:_colorArray[indexPath.row]];
    }
}

- (NSMutableArray *)colorArray {
    if (!_colorArray) {
        _colorArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 48; i++) {
            CGFloat r = arc4random()%256/255.0;
            CGFloat g = arc4random()%256/255.0;
            CGFloat b = arc4random()%256/255.0;
            UIColor* color = [UIColor colorWithRed:r green:g blue:b alpha:1];
            [_colorArray addObject:color];
        }
    }
    return _colorArray;
}

@end
