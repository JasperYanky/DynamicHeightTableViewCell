//
//  ViewController.h
//  DynamicHeightTableView
//
//  Created by Jasper on 14-6-25.
//  Copyright (c) 2014年 Jasper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    __weak IBOutlet UITableView *_tableView;
    
    NSCache *_cellCache;
    
    
    NSMutableArray *_dataArray;
}

@end
