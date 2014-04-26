//
//  PDTSimpleCalendarViewCell.m
//  PDTSimpleCalendar
//
//  Created by Jerome Miglino on 10/7/13.
//  Copyright (c) 2013 Producteev. All rights reserved.
//

#import "PDTSimpleCalendarViewCell.h"

const CGFloat PDTSimpleCalendarCircleSize = 32.0f;

@interface PDTSimpleCalendarViewCell ()

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) NSDate *date;

@end

@implementation PDTSimpleCalendarViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _date = nil;
        _isToday = NO;
        _dayLabel = [[UILabel alloc] init];
        [self.dayLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.dayLabel];

        //Add the Constraints
        [self.dayLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.dayLabel setBackgroundColor:[UIColor clearColor]];
        self.dayLabel.layer.cornerRadius = PDTSimpleCalendarCircleSize/2;
        self.dayLabel.layer.masksToBounds = YES;

        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:PDTSimpleCalendarCircleSize]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.dayLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:PDTSimpleCalendarCircleSize]];

        [self setCircleColor:NO selected:NO];
    }

    return self;
}

- (void)setDate:(NSDate *)date calendar:(NSCalendar *)calendar
{
    NSString* day = @"";
    if (date && calendar) {
        _date = date;
        NSDateComponents *dateComponents = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit fromDate:_date];
        day = [NSString stringWithFormat:@"%@", @(dateComponents.day)];
    }
    self.dayLabel.text = day;
}

- (void)setIsToday:(BOOL)isToday
{
    _isToday = isToday;
    [self setCircleColor:isToday selected:self.selected];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setCircleColor:self.isToday selected:selected];
}


- (void)setCircleColor:(BOOL)today selected:(BOOL)selected
{
    UIColor *circleColor = (today) ? [self circleTodayColor] : [self circleDefaultColor];
    UIColor *labelColor = (today) ? [self textTodayColor] : [self textDefaultColor];

    if (self.date && self.delegate) {
        if ([self.delegate respondsToSelector:@selector(simpleCalendarViewCell:shouldUseCustomColorsForDate:)] && [self.delegate simpleCalendarViewCell:self shouldUseCustomColorsForDate:self.date]) {

            if ([self.delegate respondsToSelector:@selector(simpleCalendarViewCell:textColorForDate:)] && [self.delegate simpleCalendarViewCell:self textColorForDate:self.date]) {
                labelColor = [self.delegate simpleCalendarViewCell:self textColorForDate:self.date];
            }

            if ([self.delegate respondsToSelector:@selector(simpleCalendarViewCell:circleColorForDate:)] && [self.delegate simpleCalendarViewCell:self circleColorForDate:self.date]) {
                circleColor = [self.delegate simpleCalendarViewCell:self circleColorForDate:self.date];
            }
        }
    }
    
    if (selected) {
        circleColor = [self circleSelectedColor];
        labelColor = [self textSelectedColor];
    }

    [self.dayLabel setBackgroundColor:circleColor];
    [self.dayLabel setTextColor:labelColor];
}


- (void)refreshCellColors
{
    [self setCircleColor:self.isToday selected:self.isSelected];
}


#pragma mark - Prepare for Reuse

- (void)prepareForReuse
{
    [super prepareForReuse];
    _date = nil;
    _isToday = NO;
    [self.dayLabel setText:@""];
    [self.dayLabel setBackgroundColor:[self circleDefaultColor]];
    [self.dayLabel setTextColor:[self textDefaultColor]];
}

#pragma mark - Circle Color Customization Methods

- (UIColor *)circleDefaultColor
{
    if(_circleDefaultColor == nil) {
        _circleDefaultColor = [[[self class] appearance] circleDefaultColor];
    }

    if(_circleDefaultColor != nil) {
        return _circleDefaultColor;
    }

    return [UIColor whiteColor];
}

- (UIColor *)circleTodayColor
{
    if(_circleTodayColor == nil) {
        _circleTodayColor = [[[self class] appearance] circleTodayColor];
    }

    if(_circleTodayColor != nil) {
        return _circleTodayColor;
    }

    return [UIColor grayColor];
}

- (UIColor *)circleSelectedColor
{
    if(_circleSelectedColor == nil) {
        _circleSelectedColor = [[[self class] appearance] circleSelectedColor];
    }

    if(_circleSelectedColor != nil) {
        return _circleSelectedColor;
    }

    return [UIColor redColor];
}

#pragma mark - Text Label Customizations Color

- (UIColor *)textDefaultColor
{
    if(_textDefaultColor == nil) {
        _textDefaultColor = [[[self class] appearance] textDefaultColor];
    }

    if(_textDefaultColor != nil) {
        return _textDefaultColor;
    }

    return [UIColor blackColor];
}

- (UIColor *)textTodayColor
{
    if(_textTodayColor == nil) {
        _textTodayColor = [[[self class] appearance] textTodayColor];
    }

    if(_textTodayColor != nil) {
        return _textTodayColor;
    }

    return [UIColor whiteColor];
}

- (UIColor *)textSelectedColor
{
    if(_textSelectedColor == nil) {
        _textSelectedColor = [[[self class] appearance] textSelectedColor];
    }

    if(_textSelectedColor != nil) {
        return _textSelectedColor;
    }

    return [UIColor whiteColor];
}

- (UIColor *)textDisabledColor
{
    if(_textDisabledColor == nil) {
        _textDisabledColor = [[[self class] appearance] textDisabledColor];
    }

    if(_textDisabledColor != nil) {
        return _textDisabledColor;
    }

    return [UIColor lightGrayColor];
}


- (void)checkVolunteerOfType:(NSString * )type
{
    NSLog(@"%@", self.date);
    if (!self.date)
    {
        return;
    }
    

    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *date = [dateFormat stringFromDate:self.date];

    PFQuery * query = [PFQuery queryWithClassName:@"EventDates"];
    [query whereKey:@"date" equalTo:date];
    //[query whereKeyExists:type];
    //NSLog(@"%@", self.date);

    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        /*
        if (error)
        {
            //NSLog(@"error!!!");
            self.circleDefaultColor = [UIColor whiteColor];
            //NSLog(@"%@", self.circleDefaultColor);
            [self refreshCellColors];

        }
        */
        
        if (!object) {
            //no object
            self.circleDefaultColor = [UIColor whiteColor];
            [self refreshCellColors];
        } else {
            NSLog(@"else!!!");
            NSLog(@"%@: %@", date, type);
            NSLog(@"%@", object[type]);
            if (([type isEqualToString:@"driver"] || [type isEqualToString:@"fp"]) && [object[type] isEqualToString:@""]) // there isn't a volunteer for that type
            {
                NSLog(@"redd!!!");
                self.circleDefaultColor = [UIColor redColor];
                self.textDefaultColor = [UIColor whiteColor];
                self.circleSelectedColor = [UIColor redColor];
                self.textSelectedColor = [UIColor whiteColor];
            }
            else if (!(object[@"chaperone1"] && object[@"chaperone2"]))   // chaperone
            {
                self.circleDefaultColor = [UIColor redColor];
                self.textDefaultColor = [UIColor whiteColor];
                self.circleSelectedColor = [UIColor redColor];
                self.textSelectedColor = [UIColor whiteColor];
            }
            else
            {
                self.circleDefaultColor = [UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:0.0/255.0 alpha:1];  //[UIColor greenColor];
                self.textDefaultColor = [UIColor whiteColor];
                self.circleSelectedColor = [UIColor colorWithRed:0.0/255.0 green:204.0/255.0 blue:0.0/255.0 alpha:1];
                self.textSelectedColor = [UIColor whiteColor];
            }
            [self refreshCellColors];

        }
    }];
    //self.circleDefaultColor = [UIColor redColor];
    //NSLog(@"%@", self.circleDefaultColor);

}

@end
