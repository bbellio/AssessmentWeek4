//
//  BBMovieController.h
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBMovieController : NSObject

+(void)fetchMoviesWithSearchText:(NSString *)searchText
                      completion:(void (^)(NSArray<BBMovie *>*movies))completion;
@end

NS_ASSUME_NONNULL_END
