//
//  YQTableViewCell.m
//  DynamicHeightTableView
//
//  Created by Jasper on 14-6-25.
//  Copyright (c) 2014年 Jasper. All rights reserved.
//

#import "YQTableViewCell.h"

@implementation YQTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 99999)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _contentLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
    _contentLabel.text = contentText;
    [_contentLabel sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _contentLabel.bounds.size.width, _contentLabel.bounds.size.height);
    
    
    
    NSLog(@" ..... :: %@ ",_contentLabel);
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
