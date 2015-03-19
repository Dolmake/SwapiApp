//
//  DLMKCharacter_Cell.h
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKCharacter;
#import <QuartzCore/CALayer.h> 

@interface DLMKCharacter_Cell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;

@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbUrl;

@property (nonatomic, strong) DLMKCharacter* characterModel;

@end
