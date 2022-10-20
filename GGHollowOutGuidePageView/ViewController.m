//
//  ViewController.m
//  GGHollowOutGuidePageView
//
//  Created by GRX on 2022/10/19.
//

#import "ViewController.h"
#import "GGHollowOutGuidePageView.h"
#import "SDAutoLayout.h"
@interface ViewController (){
    UIButton *btn;
}
@property(nonatomic,strong)UIButton *ggBtnOne;
@property(nonatomic,strong)UIButton *ggBtnTwo;
@property(nonatomic,strong)UIButton *ggBtnthree;
@property(nonatomic,strong)UIButton *ggBtnFour;
@property(nonatomic,strong)UIView *bottemView;
@property(nonatomic,strong)UIButton *ggBtnFive;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark====================矩形镂空引导页=========================
    /** 测试按钮1 */
    self.ggBtnOne = [[UIButton alloc]initWithFrame:CGRectMake(100,100,200,50)];
    [self.ggBtnOne addTarget:self action:@selector(ggBtnOneClick) forControlEvents:UIControlEventTouchUpInside];
    self.ggBtnOne.layer.cornerRadius = 10;
    [self.ggBtnOne setTitle:@"测试1" forState:UIControlStateNormal];
    self.ggBtnOne.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.ggBtnOne];
    /** 测试按钮2 */
    self.ggBtnTwo = [[UIButton alloc]initWithFrame:CGRectMake(100,200,200,50)];
    self.ggBtnTwo.layer.cornerRadius = 10;
    [self.ggBtnTwo setTitle:@"测试2" forState:UIControlStateNormal];
    self.ggBtnTwo.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.ggBtnTwo];
#pragma mark====================圆形镂空引导页=========================
    /** 测试按钮3 */
    self.ggBtnthree = [[UIButton alloc]initWithFrame:CGRectMake(80,400,80,80)];
    [self.ggBtnthree addTarget:self action:@selector(ggBtnthreeClick) forControlEvents:UIControlEventTouchUpInside];
    self.ggBtnthree.layer.cornerRadius = 80/2;
    [self.ggBtnthree setTitle:@"测试3" forState:UIControlStateNormal];
    self.ggBtnthree.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.ggBtnthree];
    /** 测试按钮4 */
    self.ggBtnFour = [[UIButton alloc]initWithFrame:CGRectMake(250,400,80,80)];
    self.ggBtnFour.layer.cornerRadius = 80/2;
    [self.ggBtnFour setTitle:@"测试4" forState:UIControlStateNormal];
    self.ggBtnFour.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.ggBtnFour];
#pragma mark====================嵌套View镂空引导页=========================
    self.bottemView = [[UIView alloc]init];
    self.bottemView.backgroundColor = [UIColor greenColor];
    self.bottemView.userInteractionEnabled = YES;
    [self.view addSubview:self.bottemView];
    self.bottemView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).bottomEqualToView(self.view).heightIs(100);
    /** 测试按钮5 */
    self.ggBtnFive = [[UIButton alloc]init];
    self.ggBtnFive.layer.cornerRadius = 10;
    [self.ggBtnFive setTitle:@"测试5" forState:UIControlStateNormal];
    self.ggBtnFive.backgroundColor = [UIColor orangeColor];
    [self.ggBtnFive addTarget:self action:@selector(ggBtnFiveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bottemView addSubview:self.ggBtnFive];
    self.ggBtnFive.sd_layout.leftSpaceToView(self.bottemView, 40).topSpaceToView(self.bottemView, 30).widthIs(150).heightIs(50);
}
-(void)ggBtnOneClick{
    GGHollowOutGuidePageView *guidePageOenView1 = [[GGHollowOutGuidePageView alloc]initWithFrame:self.view.bounds];
    guidePageOenView1.isStopTapGestureRecognizer = YES;
    guidePageOenView1.isStartHightLightAction = YES;
    [guidePageOenView1 creatRectangleHollowOutGuidePageView:self.ggBtnOne radius:10 hightLightImage:@""];
    [self.view addSubview:guidePageOenView1];
    guidePageOenView1.hightLightBtnClickBlock = ^{
        GGHollowOutGuidePageView *guidePageOenView2 = [[GGHollowOutGuidePageView alloc]initWithFrame:self.view.bounds];
            [guidePageOenView2 creatRectangleHollowOutGuidePageView:self.ggBtnTwo radius:10 hightLightImage:@""];
            guidePageOenView2.isStopTapGestureRecognizer = NO;
            guidePageOenView2.isStartHightLightAction = NO;
            [self.view addSubview:guidePageOenView2];
            guidePageOenView2.hightLightBtnClickBlock = ^{
                
            };
    };
    guidePageOenView1.FullScreenClickBlock = ^{
        
    };
}
-(void)ggBtnthreeClick{
    GGHollowOutGuidePageView *guidePageOenView1 = [[GGHollowOutGuidePageView alloc]initWithFrame:self.view.bounds];
    guidePageOenView1.isStopTapGestureRecognizer = YES;
    guidePageOenView1.isStartHightLightAction = YES;
    [guidePageOenView1 creatCircleHollowOutGuidePageView:self.ggBtnthree radius:50  guideImage:@""];
    [self.view addSubview:guidePageOenView1];
    guidePageOenView1.hightLightBtnClickBlock = ^{
        GGHollowOutGuidePageView *guidePageOenView2 = [[GGHollowOutGuidePageView alloc]initWithFrame:self.view.bounds];
        [guidePageOenView2 creatCircleHollowOutGuidePageView:self.ggBtnFour radius:50  guideImage:@""];
            [self.view addSubview:guidePageOenView2];
            guidePageOenView2.hightLightBtnClickBlock = ^{
                
            };
    };
    guidePageOenView1.FullScreenClickBlock = ^{
        
    };
}

-(void)ggBtnFiveClick{
    GGHollowOutGuidePageView *guidePageOenView1 = [[GGHollowOutGuidePageView alloc]initWithFrame:self.view.bounds];
    guidePageOenView1.isStopTapGestureRecognizer = NO;
    guidePageOenView1.isStartHightLightAction = NO;
    guidePageOenView1.superGuideView = self.bottemView;
    [guidePageOenView1 creatRectangleHollowOutGuidePageView:self.ggBtnFive radius:10 hightLightImage:@""];
    [self.view addSubview:guidePageOenView1];
}

@end
