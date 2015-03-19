//
//  DLMKModelServer.m
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKModelServer.h"
#import "DLMKCharacter.h"

@implementation DLMKModelServer

dispatch_queue_t queue;

static DLMKModelServer* s_instance;

//+(instancetype) SINGLETON{
//    if (!s_instance)
//        s_instance = [[DLMKModelServer alloc] init];
//    return s_instance;
//}

#pragma mark - Singleton Methods

+ (id)SINGLETON {
    static DLMKModelServer *sharedModelServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModelServer = [[self alloc] init];
    });
    return sharedModelServer;
}

#pragma mark - Init

- (id)init {
    if (self = [super init]) {
        queue = dispatch_queue_create("com.dolmake.queue", nil);
    }
    return self;
}


#pragma mark - Instance Methods

// 2 - Use queue to fetch inventory and then set label text
//dispatch_async(queue, ^{
//    self.inventory = [[IODItem retrieveInventoryItems] mutableCopy];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        ibChalkboardLabel.text = @"Inventory Loaded\n\nHow can I help you?";
//    });
//});

- (void)characterAtIndex:(NSUInteger)index aBlock:(void (^)(DLMKCharacter*))callback{
    

    dispatch_async(queue, ^{
        //ask for character at index
        //http://swapi.co/api/people/index
        
//        NSArray* jsonInventory = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:kInventoryAddress]]
//                                                                 options:kNilOptions
//                                                                   error:&err];
        
        NSError* error = nil;
        NSString* url = [NSString stringWithFormat:@"http://swapi.co/api/people/%lu",index+1];
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        NSDictionary* jsonCharacter = nil;
        if (data != nil){
           jsonCharacter  = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            callback([DLMKCharacter characterFromJSON: jsonCharacter]);
        });
        
    });
}


@end













