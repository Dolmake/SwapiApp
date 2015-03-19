//
//  DLMKCharacter_Cell.m
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKCharacter_Cell.h"
#import "DLMKCharacter.h"

@implementation DLMKCharacter_Cell

#pragma mark - Class Methods
+(CGFloat)height{
    return 74.0f;
}
+(NSString*)cellId{
    return [self description];
}

#pragma mark - Properties
-(void) setCharacterModel:(DLMKCharacter *)characterModel{
    
    _characterModel = characterModel;
    if (_characterModel != nil){
        self.lbName.text = _characterModel.name;
        self.lbUrl.text = _characterModel.URL;
    }
    else{
        self.lbName.text = @"Searching";
        self.lbUrl.text = @"url";
    }
}


#pragma mark - Instance Methods
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
