//
//  GTNormalTableViewCell.m
//  OC project
//
//  Created by 总受 on 2021/1/27.
//  Copyright © 2021 zou. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell ()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic,strong,readwrite) UIImageView *rightimageView;

@property(nonatomic,strong,readwrite) UIButton * deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightimageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.rightimageView.backgroundColor = [UIColor lightGrayColor];
            self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightimageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            
            self.deleteButton.layer.cornerRadius = 10;
            self.deleteButton.layer.masksToBounds = YES;
            
            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
            self.deleteButton.layer.borderWidth = 2;
            
            self.deleteButton;
        })];                              
    }
    return self;
}

- (void)deleteButtonClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

- (void)layoutTableViewCell{
    self.titleLabel.text = @"ios开发";
    
    self.sourceLabel.text = @"MOMO";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"4444评论";
    [self.contentView sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"四分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
     
    self.rightimageView.image = [UIImage imageNamed:@""];
}

@end
