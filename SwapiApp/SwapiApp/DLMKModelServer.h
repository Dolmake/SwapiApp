//
//  DLMKModelServer.h
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;
@class DLMKCharacter;

@interface DLMKModelServer : NSObject

+(instancetype) SINGLETON;


//-(void) characterAtIndex:(NSUInteger) index;
- (void)characterAtIndex:(NSUInteger)index aBlock:(void (^)(DLMKCharacter*))callback;


@end
