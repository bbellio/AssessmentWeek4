//
//  BBMovie.m
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBMovie.h"

static NSString * const kTitleKey = @"title";
static NSString * const kOverviewKey = @"overview";
static NSString * const kRatingKey = @"vote_average";

@implementation BBMovie

- (BBMovie *)initWithTitle:(NSString *)title overview:(NSString *)overview rating:(NSNumber *)rating
{
    self = [super init];
    if (self)
    {
        _title = title;
        _overview = overview;
        _rating = rating;
    }
    return self;
}

@end

@implementation BBMovie (JSONConvertable)

- (BBMovie *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[kTitleKey];
    NSString *overview = dictionary[kOverviewKey];
    NSNumber *rating = dictionary[kRatingKey];
    return [self initWithTitle:title overview:overview rating:rating];
}

@end


