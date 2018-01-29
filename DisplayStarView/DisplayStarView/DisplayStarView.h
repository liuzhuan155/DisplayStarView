//
//  DisplayStarView.h
//  兰众云项目Demo
//
//  Created by 刘转 on 2017/9/19.
//  Copyright © 2017年 QF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DisplayStarView;

typedef void(^finishBlock)(CGFloat currentScore);
typedef NS_ENUM(NSInteger, RateStyle)
{
    WholeStar = 0, //只能整星评论
    HalfStar = 1,  //允许半星评论
    IncompleteStar = 2  //允许不完整星评论
};
@protocol DisplayStarViewDelegate <NSObject>

-(void)starRateView:(DisplayStarView *)starRateView currentScore:(CGFloat)currentScore;

@end
@interface DisplayStarView : UIView
{
    CGFloat _starSize;        /* 根据字体大小来确定星星的大小 */
    NSInteger _maxStar;      /* 总共的长度 */
    NSInteger _showStar;    //需要显示的星星的长度
    UIColor *_emptyColor;   //未点亮时候的颜色
    UIColor *_fullColor;    //点亮的星星的颜色
}
@property (nonatomic, assign) CGFloat starSize;
@property (nonatomic, assign) NSInteger maxStar;
@property (nonatomic, assign) NSInteger showStar;
@property (nonatomic, retain) UIColor *emptyColor;
@property (nonatomic, retain) UIColor *fullColor;
@property (nonatomic,assign)CGFloat currentScore;   // 当前评分：0-5  默认0
@property (nonatomic,assign)RateStyle rateStyle;    //评分样式    默认是WholeStar
@property (nonatomic, weak) id<DisplayStarViewDelegate>delegate;
- (id)initWithFrame:(CGRect)frame delegate:(id)delegate;
-(instancetype)initWithFrame:(CGRect)frame finish:(finishBlock)finish;
@end
