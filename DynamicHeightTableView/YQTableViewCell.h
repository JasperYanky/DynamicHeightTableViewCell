//
//  YQTableViewCell.h
//  DynamicHeightTableView
//
//  Created by Jasper on 14-6-25.
//  Copyright (c) 2014年 Jasper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQTableViewCell : UITableViewCell
{
    UILabel *_contentLabel;
}
@property (nonatomic,copy) NSString *contentText;
@end
