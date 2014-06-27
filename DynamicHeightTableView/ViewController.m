//
//  ViewController.m
//  DynamicHeightTableView
//
//  Created by Jasper on 14-6-25.
//  Copyright (c) 2014年 Jasper. All rights reserved.
//

#import "ViewController.h"
#import "YQTableViewCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // load data for text
    _dataArray = [[NSMutableArray alloc]init];
    NSString *kind1 = @"1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    NSString *kind2 = @"2222222222222222";
    NSString *kind3 = @"3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333";
    _array = [NSArray arrayWithObjects:kind1,kind2,kind3,nil];
    for (int i = 0; i < 10; i++) {
        [_dataArray addObjectsFromArray:_array];
    }
    
    //init cacheContainer
    _cellCache = [[NSCache alloc]init];
    
    

}

- (void)viewDidAppear:(BOOL)animated
{
    [_tableView reloadData];
}


#pragma mark - tabaleViewDelegate & dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    id data = [_dataArray objectAtIndex:indexPath.row];
    YQTableViewCell *cell = (YQTableViewCell *)[self tableView:tableView preparedCellForIndexPath:indexPath withData:data];
    return cell.bounds.size.height;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   // NSLog(@" [_dataArray count] %@",[_dataArray count]);
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id data = [_dataArray objectAtIndex:indexPath.row];
    YQTableViewCell *cell = (YQTableViewCell *)[self tableView:tableView preparedCellForIndexPath:indexPath withData:data];
    return cell;
}


#pragma mark -  handle cells

- (UITableViewCell *)tableView:(UITableView *)tableView preparedCellForIndexPath:(NSIndexPath *)indexPath withData:(id)data
{
    NSString *key = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.section, (long)indexPath.row];
    //try to get the cell from cache
	YQTableViewCell *cell = [_cellCache objectForKey:key];
	if (!cell)
	{
        //dont hit the cache then reuse cell from tableview
        static NSString *cellIdentifier= @"YQCell";
        cell = (YQTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        //at last still dont get the cell , creat a new cell
        if (!cell) {
            cell = [[YQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        [cell setContentText:data];
        // cache it, if there is a cache
        [_cellCache setObject:cell forKey:key];
    }
    
    return cell;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
