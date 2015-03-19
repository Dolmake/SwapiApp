//
//  DLMKCharacter.m
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKCharacter.h"

@implementation DLMKCharacter

#pragma mark - Class Methods
+(instancetype) characterFromJSON: (NSDictionary*)jsonCharacter{
    DLMKCharacter* character = [[DLMKCharacter alloc] initWithJSON:jsonCharacter ];
    return character;
}

#pragma mark - Init
-(id) initWithJSON:(NSDictionary*)jsonCharacter{
    
    if (self = [super init]){
        //Deserialize
        if (jsonCharacter != nil)
        {
            _name = [jsonCharacter  objectForKey:@"name"];
            _URL = [jsonCharacter objectForKey:@"url"];
            _mass = [jsonCharacter objectForKey:@"mass"];
        }
        else
        {
            _name = @"404 not found";
        }
        
    }
    return self;
}


#pragma mark - Instance Methods

-(NSString*) description{
    return self.name;
}
@end
