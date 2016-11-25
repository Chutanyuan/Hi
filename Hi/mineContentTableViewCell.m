//
//  mineContentTableViewCell.m
//  Hi
//
//  Created by user_kevin on 16/11/25.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "mineContentTableViewCell.h"

@interface mineContentTableViewCell ()

@property(nonatomic,strong)UILabel * timelabel;
@property(nonatomic,strong)UILabel * contentText;
@property(nonatomic,strong)UIImageView * contentImage;

@end

@implementation mineContentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIView * colorView = [[UIView alloc]init];
        colorView.backgroundColor = [CorlorTransform colorWithHexString:@"#E4E4E4"];
        [self addSubview:colorView];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"dd-MM"];
        
        NSDate *confromTimesp = [NSDate date];
        NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
        NSArray * dateArray = [confromTimespStr componentsSeparatedByString:@"-"];
        NSString * chineseMonth = [self getMonth:[[dateArray lastObject] integerValue]];
        NSMutableAttributedString * changetext = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n%@",[dateArray firstObject],chineseMonth]];
        NSRange range  = [[changetext string]rangeOfString:[dateArray firstObject]];
        [changetext addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size:17.0] range:range];
        NSRange range2 = [[changetext string]rangeOfString:chineseMonth];
        [changetext addAttribute:NSFontAttributeName value:[FontOutSystem fontWithFangZhengSize:10.0] range:range2];
        _timelabel = [[UILabel alloc]init];
        _timelabel.attributedText = changetext;
        _timelabel.numberOfLines = 2;
        CGSize size = CGSizeMake(35, 1000);
        CGSize size_timelabel = [_timelabel.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:_timelabel.font,NSFontAttributeName, nil] context:nil].size;
        _timelabel.frame = CGRectMake(10, 10, size_timelabel.width, size_timelabel.height);
        [self addSubview:_timelabel];
        
        _contentText = [[UILabel alloc]init];
        _contentText.text = @"金尊清酒斗十千，玉盘珍羞直万钱。停杯投箸不能食，拔剑四顾心茫然。欲渡黄河冰塞川，将登太行雪暗天。闲来垂钓坐溪上，忽复乘舟梦日边。行路难，行路难，多岐路，今安在。长风破浪会有时，直挂云帆济沧海。";
        _contentText.numberOfLines = 0;
        _contentText.font = [FontOutSystem fontWithFangZhengSize:17.0];
        CGSize size2 = CGSizeMake(screenwidth-10-_timelabel.frame.origin.x-_timelabel.frame.size.width-10, 1000);
        CGSize size_contentText = [_contentText.text boundingRectWithSize:size2 options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:_contentText.font,NSFontAttributeName, nil] context:nil].size;
        _contentText.frame = CGRectMake(_timelabel.frame.size.width+_timelabel.frame.origin.x+10, _timelabel.frame.origin.y+5, size_contentText.width, size_contentText.height);
        [self addSubview:_contentText];
        
        if (size_contentText.height>size_timelabel.height) {
            CGRect frame2 = self.frame;
            frame2.size.height = size_contentText.height+25;
            self.frame = frame2;
        }else{
            CGRect frame = self.frame;
            frame.size.height = size_timelabel.height+20;
            self.frame = frame;
        }
        
        _contentImage = [[UIImageView alloc]init];
        _contentImage.image = [UIImage imageNamed:@"10"];
        _contentImage.frame = CGRectMake(_contentText.frame.origin.x, _contentText.frame.origin.y+_contentText.frame.size.height+10, size_contentText.width, size_contentText.width);
        [self addSubview:_contentImage];
        
        
       
        colorView.frame = CGRectMake(_contentImage.frame.origin.x-5, _timelabel.frame.origin.y, size_contentText.width+10, _contentImage.frame.origin.y+_contentImage.frame.size.height+10);
        
        CGRect frame3 = self.frame;
        frame3.size.height = _contentImage.frame.size.height+35+20+size_contentText.height;
        self.frame = frame3;
    }
    return self;
}

-(NSString*)getMonth:(NSInteger)Month
{
    NSString*weekStr=nil;
    if(Month==1)
    {
        weekStr=@"一月";
    }else if(Month==2){
        weekStr=@"二月";
        
    }else if(Month==3){
        weekStr=@"三月";
        
    }else if(Month==4){
        weekStr=@"四月";
        
    }else if(Month==5){
        weekStr=@"五月";
        
    }else if(Month==6){
        weekStr=@"六月";
        
    }else if(Month==7){
        weekStr=@"七月";
        
    }else if(Month==8){
        weekStr=@"八月";
        
    }else if(Month==9){
        weekStr=@"九月";
        
    }else if(Month==10){
        weekStr=@"十月";
        
    }else if(Month==11){
        weekStr=@"十一";
        
    }else if(Month==12){
        weekStr=@"十二";
        
    }
    return weekStr;
}


-(void)setDictionary:(NSDictionary *)dictionary
{
    
}

@end
