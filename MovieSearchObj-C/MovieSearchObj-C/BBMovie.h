//
//  BBMovie.h
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBMovie : NSObject

@property(nonatomic, copy, readonly)NSString *title;
@property(nonatomic, copy, readonly)NSString *overview;
@property(nonatomic, readonly)NSNumber *rating;

-(BBMovie *)initWithTitle:(NSString *)title
                 overview:(NSString *)overview
                   rating:(NSNumber *)rating;

@end

@interface BBMovie (JSONSerialization)

-(BBMovie *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
