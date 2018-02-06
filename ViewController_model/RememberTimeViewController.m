//
//  RememberTimeViewController.m
//  ViewController_model
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "RememberTimeViewController.h"
#import <objc/runtime.h>
@interface RememberTimeViewController ()
@property(nonatomic,assign)NSUInteger  num_ms;//毫秒
@property (weak, nonatomic) IBOutlet UILabel *num_ms_lab;

@property(nonatomic,assign)NSUInteger  num_ss;//秒

@property (weak, nonatomic) IBOutlet UILabel *num_ss_lab;
@property(nonatomic,assign)NSUInteger  num_Ms;//分
@property (weak, nonatomic) IBOutlet UILabel *num_Ms_lab;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation RememberTimeViewController{
    NSTimeInterval deadTime;
    dispatch_source_t timer;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_timer invalidate];
    _timer = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.disableMLTransition = NO;
    _num_ss = 0;
    _num_ms = 0;
    _num_Ms = 0;
//    _timer = [[NSTimer alloc]initWithTimeInterval:1.0/100 target:self selector:@selector(timerAction) userInfo:nil repeats:YES dispatchQueue:dispatch_get_global_queue(0, 0)];
    _timer = [[NSTimer alloc]initWithFireDate:[NSDate date] interval:1.0/100 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    // 初始化后添加 显示时间倒计时
}
-(void)SetNavOther{
    self.title = @"计时器";
    [self AddBackBtn];
}
- (IBAction)start:(id)sender {
    
    
////   _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/100 target:self selector:@selector(timerAction) userInfo:nil repeats:YES] ;
//    dispatch_queue_t queue = dispatch_queue_create("com.xhb.pfjdsalfj", DISPATCH_QUEUE_CONCURRENT);
//    _timer = [MSWeakTimer scheduledTimerWithTimeInterval:1.0/100.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES dispatchQueue:queue];
//    [self.timer fire];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];


    NSLog(@"???");
}



- (IBAction)pause:(id)sender {
//    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:-1000]];
    [_timer setFireDate:[NSDate distantFuture]];
}
- (IBAction)stop:(id)sender {
    [_timer invalidate];
}
- (IBAction)Continue:(id)sender {
    [_timer setFireDate:[NSDate date]];
}
/*
 // 获取时间间隔
 - (NSTimeInterval)timeIntervalWithFormatterString : (NSString *)formatterString andFutureDataString : (NSString *)futureDataString
 {
 // 获取当前时间
 NSDate *date = [NSDate date] ;
 // 创建时间格式对象
 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
 // 设置时间格式
 [dateFormatter setDateFormat:formatterString] ;
 // 将你需要的时间格式字符串转化为日期对象
 NSDate *futureDate = [dateFormatter dateFromString:futureDataString] ;
 // 获取当前时间距你所需要时间的时间间隔
 NSTimeInterval timerInterval = [futureDate timeIntervalSinceDate:date] ;
 return timerInterval ;
 }
 */
// 每间隔一秒定时器触发执行该方法
- (void)timerAction
{
    // 定时器每次触发 时间间隔减一 也就是说时间间隔依次递减
    _num_ms++;
    
    // 当时间间隔为0时干掉定时器
    if (_num_ms == 99) {
        _num_ms = 0;
        _num_ss ++;
        if (_num_ss==59) {
            _num_ss = 0;
            _num_Ms++;
            if(_num_Ms==59){
                _num_Ms =0;
            }
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        _num_ms_lab.text = [NSString stringWithFormat:@":%02li",_num_ms];
        _num_ss_lab.text = [NSString stringWithFormat:@":%02li",_num_ss];
        _num_Ms_lab.text = [NSString stringWithFormat:@"%02li",_num_Ms];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
