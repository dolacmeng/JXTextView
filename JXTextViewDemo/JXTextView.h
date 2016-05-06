//
//  JXTextView.h
//  JXTextViewDemo
//
//  Created by JackXu on 16/5/6.
//  Copyright © 2016年 HunYu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JXTextView;

@protocol JXTextViewDelegate <NSObject>

-(void)textView:(JXTextView*)textView heightChange:(CGFloat)height;

@end

@interface JXTextView : UITextView

@property (nonatomic,strong) NSString *placeholder;
@property (nonatomic,weak) id<JXTextViewDelegate> textDelegate;

@end


