//
//  DLMKCharacter.h
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import Foundation;

@interface DLMKCharacter : NSObject

+(instancetype) characterFromJSON: (NSDictionary*)jsonCharacter;

@property (copy,nonatomic) NSString* name;
@property (copy, nonatomic) NSString* URL;
@property (nonatomic) NSNumber* mass;


-(id) initWithJSON:(NSDictionary*)jsonCharacter;

@end
