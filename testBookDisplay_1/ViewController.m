//
//  ViewController.m
//  testBookDisplay_1
//
//  Created by Cyrilshanway on 2014/11/24.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"
#import "BookViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *dataSource;
    NSArray *detailDataSource;
    NSDictionary *bookDict;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataSource = [NSArray arrayWithObjects:@"Message1", @"Message2", @"Message3", @"Message4", @"Message5", @"Message6", @"Message7", @"Message8", nil];
    detailDataSource = [NSArray arrayWithObjects:@"Abstract1", @"Abstract2", @"Abstract3", @"Abstract4", @"Abstract5", @"Abstract6", @"Abstract7", @"Abstract8", nil];
    
    bookDict = [NSDictionary dictionaryWithObjectsAndKeys:  @"977", @"isbn13", @"金字塔原理",@"title", nil];//value/key
    
    BookViewController *myBKVC = [[BookViewController alloc] init];
    myBKVC.title = @"";
    
    NSDictionary *myBook =[NSDictionary dictionaryWithObjectsAndKeys:  @"977", @"isbn13",@"金字塔原理",@"title",@"387",@"page",@"Babarlisa",@"author", nil];//value/key
    
    NSLog(@"DataSource: %@", dataSource);
    NSLog(@"Detail DataSource: %@", detailDataSource);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate
//分類
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//欄位高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

#pragma  mark -- data sourse delegate(require)
//分類數量(section)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return dataSource.count;
    return 2;
}
//內容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *requestIdentifier = @"Cell1";
    static NSString *requestIdentifier2= @"Cell2";
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:requestIdentifier];
                //cell背景
                cell.backgroundColor = [UIColor grayColor];
                //cell.backgroundColor = [UIColor clearColor];
                //cell.alpha = 0.0f;
                //cell字的顏色
                cell.textLabel.textColor = [UIColor blueColor];
                cell.detailTextLabel.textColor = [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
                //cell字型
                cell.textLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:14.0f];
                cell.detailTextLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:12.0f];
                //cell被選到的狀態
                cell.selectionStyle = UITableViewCellSelectionStyleBlue;
                
            }
        }
            break;
         case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier2];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:requestIdentifier2];
                //cell背景
                cell.backgroundColor = [UIColor blueColor];
                //cell字的顏色
                cell.textLabel.textColor = [UIColor blueColor];
                cell.detailTextLabel.textColor = [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
                //cell字型
                cell.textLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:14.0f];
                cell.detailTextLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:12.0f];
                //cell被選到的狀態
                cell.selectionStyle = UITableViewCellSelectionStyleBlue;
            }
        }
            break;
        default:
            break;
    }
    
    //把資料加進TableView
    //cell.textLabel.text = dataSource[indexPath.row];
    //cell.detailTextLabel.text = detailDataSource[indexPath.row];
    
    cell.textLabel.text = bookDict[@"isbn13"];
    cell.detailTextLabel.text = bookDict[@"title"];
    
    
    
    //button名稱
    NSString *title;
    switch (indexPath.section) {
        case 0:
            title = @"Download";
            break;
        case 1:
            title = @"Upload";
            break;
        default:
            break;
    }
    
    //在每個cell後面新增button
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(230, 10, 80, 40)];
    //設定名稱
    [btn setTitle:title forState:(UIControlStateNormal)];
    //設定字型
    btn.titleLabel.font = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:12.0f];
    //背景
    btn.backgroundColor = [UIColor clearColor];
    //設定button tag
    btn.tag = indexPath.row;
    //設定button的功能
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
    //btn加進cell
    [cell.contentView addSubview:btn];
    //利用layer(UIView都可用)更改button外觀
    [btn.layer setCornerRadius:10.0f];
    [btn.layer setBorderWidth:2.0f];
    [btn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    return cell;
}
//cell是否選到的delegate方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You pressed: %ld %ld", indexPath.section, indexPath.row);
}
- (void)buttonPressed:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"You Press the button %ld", btn.tag);
}
@end
