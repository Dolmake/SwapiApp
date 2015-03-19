//
//  DetailViewController.h
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

@import UIKit;
@class DLMKCharacter;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) DLMKCharacter* detailItem;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *acLoadingPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imgPhoto;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *lbURL;
- (IBAction)onLoadAsync:(id)sender;

@end

