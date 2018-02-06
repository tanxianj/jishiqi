//
//  View2Controller.m
//  ViewController_model
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "View2Controller.h"
#import "RememberTimeViewController.h"

@interface View2Controller ()

@end

@implementation View2Controller
-(BOOL)HiddenNavView{
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)SetNavOther{
    self.title = @"测试";
    [self AddBackBtn];
    self.navigationItem.rightBarButtonItem = [self setupNavigationItemWithLeft:Nav_Right_Item imageName:nil title:@"右按钮" callBack:^{
        XJLog(@"按钮测试");
      RememberTimeViewController *remember =   [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"remember"];
        [self.navigationController pushViewController:remember animated:YES];
    }];
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
