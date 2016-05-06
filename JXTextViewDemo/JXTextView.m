//
//  JXTextView.m
//  JXTextViewDemo
//
//  Created by JackXu on 16/5/6.
//  Copyright © 2016年 HunYu. All rights reserved.
//

#import "JXTextView.h"

@interface JXTextView()

@property (nonatomic,strong) UILabel *placeholderLabel;

@end


@implementation JXTextView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _placeholderLabel.textColor = [UIColor lightGrayColor];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.font = self.font;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_placeholderLabel];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidBeginEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidEndEditingNotification object:nil];
    }
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}

- (void)textDidChange:(NSNotification *)notification
{
    if([notification.name isEqualToString:UITextViewTextDidChangeNotification]){
        [self flashScrollIndicators];
        CGRect frame = self.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size = [self sizeThatFits:constraintSize];
        self.scrollEnabled = NO;
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
        if ([self.textDelegate respondsToSelector:@selector(textView:heightChange:)]) {
            [self.textDelegate textView:self heightChange:frame.size.height];
        }
    }
    
    if(_placeholder.length != 0){
        if(self.text.length == 0 && ![self isFirstResponder])
            [_placeholderLabel setAlpha:1];
        else
            [_placeholderLabel setAlpha:0];
    }
}

@end
