//
//  ViewController.m
//  DrawDemo
//
//  Created by mby on 15/11/5.
//  Copyright © 2015年 mby. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"
#import "Toolbar.h"
#import "ColorDisk.h"

@interface ViewController ()<ToolbarButtonActionDelegate, ColorDiskDelegate>

@property (nonatomic, strong) Canvas* canvas;

@property (nonatomic, strong) Toolbar* toolbar;

@property (nonatomic, strong) ColorDisk* colorDisk;

@property (nonatomic, strong) Brush* brush;

@property (strong, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    _brush = [[Brush alloc] initWithColor:[UIColor redColor] withWidth:3.0];
    
    _canvas = [[Canvas alloc] init];
    _canvas.brush = _brush;
    [self.view addSubview:_canvas];
    
    _toolbar = [[Toolbar alloc] init];
    _toolbar.delegate = self;
    [_toolbar hide];
    [self.view addSubview:_toolbar];
    
    [self.view sendSubviewToBack:_canvas];
    [_showBtn addTarget:self action:@selector(showToolbar) forControlEvents:(UIControlEventTouchUpInside)];
    
    _colorDisk = [ColorDisk sharedInstance];
    _colorDisk.delegate = self;
    _colorDisk.hidden = YES;
    [self.view addSubview:_colorDisk];
}

- (void)showToolbar {
    [_toolbar show];
    _showBtn.hidden = YES;
}

- (void)toolbarButtonClickWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            [_canvas clear];
            break;
        case 1:
            [self save];
            break;
        case 2:
            [_colorDisk setHidden:NO];
            break;
        case 3:
            [_toolbar hide];
            _showBtn.hidden = NO;
            break;
    }
}

- (void)save {
    
    UIGraphicsBeginImageContext(_canvas.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*  viewImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, self,@selector(image:didFinishSavingWithError:contextInfo:),NULL);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    UIAlertView* av = [[UIAlertView alloc] initWithTitle:nil message:@"保存成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [av show];
}

- (void)didChooseColor:(UIColor *)color {
    _brush.color = color;
    _colorDisk.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
