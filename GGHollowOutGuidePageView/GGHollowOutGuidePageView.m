//
//  GGHollowOutGuidePageView.m
//  GGHollowOutGuidePageView
//
//  Created by GRX on 2022/10/19.
//

#import "GGHollowOutGuidePageView.h"

@interface GGHollowOutGuidePageView ()
@property(strong,nonatomic)UIView *fullGuideBgView;
@property(strong,nonatomic)UIImageView *HollowOutImageView;
@end

@implementation GGHollowOutGuidePageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.fullGuideBgView];
        [self.fullGuideBgView addSubview:self.HollowOutImageView];
        self.fullGuideBgView.frame = self.frame;
    }
    return self;
}

-(void)creatCircleHollowOutGuidePageView:(UIView *)hightLightView radius:(CGFloat)radius guideImage:(NSString *)guideImage
{
    /** 圆形 */
    CGFloat width = hightLightView.frame.size.width;
    CGFloat height = hightLightView.frame.size.height;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [bezierPath appendPath:[UIBezierPath bezierPathWithArcCenter:hightLightView.center radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO]];
    CAShapeLayer *sharpLayer = [CAShapeLayer layer];
    sharpLayer.path = bezierPath.CGPath;
    sharpLayer.fillRule = kCAFillRuleEvenOdd;
    [self.fullGuideBgView.layer setMask:sharpLayer];
    self.HollowOutImageView.frame = hightLightView.frame;
    self.HollowOutImageView.image = [UIImage imageNamed:guideImage];
    /** 高亮显示按钮 */
    UIButton *hightLightBtn = [[UIButton alloc]init];
    hightLightBtn.frame = CGRectMake(hightLightView.center.x-width/2, hightLightView.center.y-height/2, width, height);
    [self.fullGuideBgView addSubview:hightLightBtn];
    [hightLightBtn addTarget:self action:@selector(hightLightBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)creatRectangleHollowOutGuidePageView:(UIView *)hightLightView radius:(CGFloat)radius hightLightImage:(NSString *)hightLightImage
{
    /** 矩形 */
    CGFloat leftRightSpace = 10;
    CGFloat upDownSpace = 10;
    CGFloat width = hightLightView.frame.size.width;
    CGFloat height = hightLightView.frame.size.height;
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) cornerRadius:0];
    if(self.superGuideView){
        [bpath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(hightLightView.center.x-width/2-leftRightSpace, self.superGuideView.frame.origin.y+hightLightView.frame.origin.y-upDownSpace, width+leftRightSpace*2, height+upDownSpace*2) cornerRadius:radius] bezierPathByReversingPath]];
    }else{
        [bpath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(hightLightView.center.x-width/2-leftRightSpace, hightLightView.center.y-height/2-upDownSpace, width+leftRightSpace*2, height+upDownSpace*2) cornerRadius:radius] bezierPathByReversingPath]];
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    [self.fullGuideBgView.layer setMask:shapeLayer];
    self.HollowOutImageView.frame = hightLightView.frame;
    self.HollowOutImageView.image = [UIImage imageNamed:hightLightImage];
    /** 高亮显示按钮 */
    UIButton *hightLightBtn = [[UIButton alloc]init];
    if(self.superGuideView){
        hightLightBtn.frame = CGRectMake(hightLightView.center.x-width/2-leftRightSpace, self.superGuideView.frame.origin.y+hightLightView.frame.origin.y-upDownSpace, width+leftRightSpace*2, height+upDownSpace*2);
    }else{
        hightLightBtn.frame = CGRectMake(hightLightView.center.x-width/2-leftRightSpace, hightLightView.center.y-height/2-upDownSpace, width+leftRightSpace*2, height+upDownSpace*2);
    }
    [self.fullGuideBgView addSubview:hightLightBtn];
    [hightLightBtn addTarget:self action:@selector(hightLightBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)hightLightBtnClick{
    if (self.isStartHightLightAction) {
        if(self.hightLightBtnClickBlock){
            self.hightLightBtnClickBlock();
        }
        [self.fullGuideBgView removeFromSuperview];
        [self.HollowOutImageView removeFromSuperview];
        [self removeFromSuperview];
    }
}

-(void)fullGuideBgViewClick
{
    if(self.isStopTapGestureRecognizer){
        return;
    }
    if(self.FullScreenClickBlock){
        self.FullScreenClickBlock();
    }
    [self.fullGuideBgView removeFromSuperview];
    [self.HollowOutImageView removeFromSuperview];
    [self removeFromSuperview];
    
}

#pragma mark -- 懒加载
-(UIView *)fullGuideBgView
{
    if (_fullGuideBgView == nil) {
        _fullGuideBgView = [[UIView alloc]initWithFrame:CGRectZero];
        _fullGuideBgView.backgroundColor = [UIColor blackColor];
        _fullGuideBgView.alpha = 0.8;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fullGuideBgViewClick)];
        [_fullGuideBgView addGestureRecognizer:tap];
    }
    return _fullGuideBgView;
}

-(UIImageView *)HollowOutImageView
{

    if (_HollowOutImageView == nil) {
        _HollowOutImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _HollowOutImageView;
}
@end
