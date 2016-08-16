//
//  ThumbToBlurHandler.h
//  ThumbToBlur
//
//  Created by 曹建峰 on 16/8/16.
//  Copyright © 2016年 u17. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GPUImage/GPUImage.h>
@interface ThumbToBlurHandler : NSObject{
    GPUImagePicture *sourcePicture;
    GPUImageOutput<GPUImageInput> *blurFilter;
}

-(GPUImageView*)createViewWithFrame:(CGRect)viewFrame withImage:(UIImage*)inputImage withRadius:(int)blurRadius;
-(void)startBlur:(void (^)(void))completion;

@end
