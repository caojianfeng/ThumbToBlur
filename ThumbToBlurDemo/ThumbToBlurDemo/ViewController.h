//
//  ViewController.h
//  ThumbToBlurDemo
//
//  Created by 曹建峰 on 16/8/16.
//  Copyright © 2016年 u17. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef __OBJC__
#import <ThumbToBlur/ThumbToBlurHandler.h>
#endif
@interface ViewController : UIViewController{
    ThumbToBlurHandler * thumbToBlurHandler;
    UILabel *label;
    UIButton *button;
}


@end

