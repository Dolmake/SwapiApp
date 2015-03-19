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
        self.imgPhoto.image = [UIImage imageNamed:@"Icon-72@2x.png"];
    }
    else{
        self.lbName.text = @"Searching";
        self.lbUrl.text = @"url";
        self.imgPhoto.image = nil;
    }
}

#pragma mark - Instance Methods
- (void)awakeFromNib {
    // Initialization code
    
    self.imgPhoto.layer.masksToBounds = YES;
    self.imgPhoto.layer.cornerRadius = self.imgPhoto.frame.size.width * 0.5f;
    self.imgPhoto.layer.borderWidth = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) prepareForReuse{
    self.characterModel = nil;
}

@end
