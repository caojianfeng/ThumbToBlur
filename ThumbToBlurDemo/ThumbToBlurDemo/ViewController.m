//
//  ViewController.m
//  ThumbToBlurDemo
//
//  Created by 曹建峰 on 16/8/16.
//  Copyright © 2016年 u17. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark - View creating
- (UIImage*) createUIImage{
    //http://i1.piimg.com/565547/b8c23a33e65390bf.jpg
    UIImage *inputImage = [UIImage imageNamed:@"test.webp"];
    if(!inputImage){
        NSLog(@"image 'test.webp' not found");
        inputImage = [UIImage imageNamed:@"test.jpg"];
        if(!inputImage){
            NSLog(@"image 'test.jpg' not found");
            return nil;
        }else{
            NSLog(@"using image 'test.jpg'");
            return inputImage;
        }
    }else{
        NSLog(@"using image 'test.webp'");
        return inputImage;
    }
}

-(CGRect)countFrame{
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    CGRect viewFrame = mainScreenFrame;
    viewFrame.size.height = mainScreenFrame.size.width*2/3;
    return viewFrame;
}

-(void) initView:(CGRect)mainScreenFrame{

    CGFloat centerx = mainScreenFrame.size.width/2;
    CGFloat bottomy = mainScreenFrame.origin.y+ mainScreenFrame.size.height-50;
    CGFloat topy = 150;

    if (!label){
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 400)];
        label.textColor = [UIColor whiteColor];
        
        label.center = CGPointMake(centerx,topy);
        [self.view addSubview:label];
    }
    
    if(!button){
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:@"[开始]" forState:UIControlStateNormal];
        [button setTitle:@"<开始>" forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        button.titleLabel.textColor = [UIColor lightGrayColor];
        button.backgroundColor = [UIColor darkGrayColor];
        
        button.bounds = CGRectMake(0, 600, 200, 50);
        
        
        button.center = CGPointMake(centerx,bottomy);
        [self.view addSubview:button];
    }
}
//按钮响事件函数

-(void)button:(UIButton *)sender{
    long begin = [[NSDate date] timeIntervalSince1970] * 1000;
    NSLog(@"begin %ld" , begin);

    [thumbToBlurHandler startBlur:^(void){
        long end =  [[NSDate date] timeIntervalSince1970] * 1000;
        long use = end - begin;
        NSString * txt = [NSString stringWithFormat:@"耗时%ldms",use];
        NSLog(@"end  %ld , %@" , end,txt);
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self updateInfo:txt];
        });
        NSLog(@"set txt");
    }];
    [self updateInfo:@"processing ..."];
}

-(void)updateInfo:(NSString*)msg{
    [label setText:msg];
}

#pragma mark - Image Filter



#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect mainScreenFrame = [[UIScreen mainScreen] bounds];
    [self initView:mainScreenFrame];
}

-(void)loadView{
    if(!thumbToBlurHandler){
        thumbToBlurHandler = [[ThumbToBlurHandler alloc] init];
    }
    UIImage * inputImage = [self createUIImage];
    CGRect viewFrame = [self countFrame];
    GPUImageView *imgView = [thumbToBlurHandler createViewWithFrame:viewFrame withImage:inputImage withRadius:64];
    self.view = imgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
