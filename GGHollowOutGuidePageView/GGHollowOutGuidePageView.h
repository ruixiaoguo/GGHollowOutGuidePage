//
//  GGHollowOutGuidePageView.h
//  GGHollowOutGuidePageView
//
//  Created by GRX on 2022/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GGHollowOutGuidePageView : UIView
/** 创建圆形镂空引导 */
-(void)creatCircleHollowOutGuidePageView:(UIView *)hightLightView radius:(CGFloat)radius guideImage:(NSString *)guideImage;
/** 创建矩形镂空引导 */
-(void)creatRectangleHollowOutGuidePageView:(UIView *)hightLightView radius:(CGFloat)radius hightLightImage:(NSString *)hightLightImage;
@property(assign,nonatomic)BOOL isStopTapGestureRecognizer;/** 是否禁用点击背景操作 */
@property(assign,nonatomic)BOOL isStartHightLightAction;/** 是否允许点击高亮按钮操作 */
@property(strong,nonatomic)UIView *superGuideView;/** 嵌套父视图View */
/** Block回调 */
@property(copy,nonatomic)void(^FullScreenClickBlock)(void);
@property(copy,nonatomic)void(^hightLightBtnClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
