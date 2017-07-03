//
//  ViewController.m
//  Slider_view
//
//  Created by Qu ZhongLiang on 17/6/8.
//  Copyright © 2017年 Qu ZhongLiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *sliderTableV;
@property(nonatomic, strong)UIView *headBNackView;
@property(nonatomic, strong)UIImageView *headerImageV;
@end

@implementation ViewController
- (UITableView *)sliderTableV
{
    if (!_sliderTableV) {
        _sliderTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    }
    _sliderTableV.backgroundColor = [UIColor blueColor];
    _sliderTableV.delegate = self;
    _sliderTableV.dataSource = self;
    return _sliderTableV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.sliderTableV];
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width - 100)];
    self.headBNackView = header;
    _sliderTableV.tableHeaderView = header;
    
    UIImageView *imgaeV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width - 100)];
    [header addSubview:imgaeV];
    self.headerImageV = imgaeV;
    imgaeV.image = [UIImage imageNamed:@"timg.jpg"];
    [_sliderTableV insertSubview:self.headBNackView atIndex:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *cellIdentifer = @"cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifer];
    }
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offest = scrollView.contentOffset.y;
    NSLog(@"===%f",offest);
    CGRect frame = self.headerImageV.frame;
    if (offest < 0) {
        frame.origin.y = offest;
        frame.size.height = self.view.frame.size.width - 100 - offest;
        frame.origin.x = offest/2;
        frame.size.width = self.view.frame.size.width - offest;
    }else{
        frame.origin.y = offest/2;
    }
    self.headerImageV.frame = frame;
    [self.sliderTableV insertSubview:self.headBNackView atIndex:0];
}

@end
