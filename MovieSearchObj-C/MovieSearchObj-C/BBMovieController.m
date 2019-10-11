//
//  BBMovieController.m
//  MovieSearchObj-C
//
//  Created by Bethany Wride on 10/11/19.
//  Copyright © 2019 Bethany Wride. All rights reserved.
//

#import "BBMovieController.h"

static NSString * const kBaseURLString =@"https://api.themoviedb.org/3/";
static NSString * const kSearchComponent = @"search";
static NSString * const kMovieComponent = @"movie";
static NSString * const kApiKey = @"api_key";
static NSString * const kApiValue = @"d466b0951e5d182365d820b6701a6bfd";
static NSString * const kQueryKey = @"query";

@implementation BBMovieController

+ (void)fetchMoviesWithSearchText:(NSString *)searchText completion:(void (^)(NSArray<BBMovie *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:kSearchComponent];
    NSURL *movieURL = [searchURL URLByAppendingPathComponent:kMovieComponent];
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:kApiKey value:kApiValue];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:kQueryKey value:searchText];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];
    urlComponents.queryItems = @[apiQueryItem, searchQueryItem];
    NSURL *finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@, error in dataTask", error.localizedDescription);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            NSArray *resultsArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error][@"results"];
            if (!resultsArray)
            {
                NSLog(@"Error parsing JSON - no topLevelDictionary found: %@", error);
                completion(nil);
                return;
            }
            NSMutableArray *movieArray = [NSMutableArray new];
            for (NSDictionary *movieDicitionary in resultsArray)
            {
                BBMovie *decodedMovie = [[BBMovie alloc] initWithDictionary:movieDicitionary];
                [movieArray addObject:decodedMovie];
            }
            completion(movieArray);
        }
    }]resume];
} // End of function
@end
