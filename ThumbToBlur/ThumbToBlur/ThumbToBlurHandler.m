//
//  ThumbToBlurHandler.m
//  ThumbToBlur
//
//  Created by 曹建峰 on 16/8/16.
//  Copyright © 2016年 u17. All rights reserved.
//

#import "ThumbToBlurHandler.h"

@implementation ThumbToBlurHandler
-(GPUImageView*)createViewWithFrame:(CGRect)viewFrame withImage:(UIImage*)inputImage withRadius:(int)blurRadius{
    sourcePicture = [[GPUImagePicture alloc] initWithImage:inputImage smoothlyScaleOutput:NO];
    //或者用地址[[GPUImagePicture alloc] initWithURL:inputImageURL];
    
    GPUImageGaussianBlurFilter * gbFilter = [[GPUImageGaussianBlurFilter alloc] init];
    gbFilter.blurRadiusInPixels = blurRadius;
    blurFilter = gbFilter;
    
    GPUImageView *primaryView = [[GPUImageView alloc] initWithFrame:viewFrame];
    [blurFilter forceProcessingAtSize:primaryView.sizeInPixels];
    [sourcePicture addTarget:blurFilter];
    [blurFilter addTarget:primaryView];
    
    return primaryView;
}

-(void)startBlur:(void (^)(void))completion{
    if(DEBUG){
        NSLog(@"startBlur");
    }
    if(!sourcePicture){
        NSLog(@"createViewWithFrame first!");
        return;
    }
    
    [sourcePicture processImageWithCompletionHandler:completion];
}


@end
