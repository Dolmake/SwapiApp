//
//  DetailViewController.m
//  SwapiApp
//
//  Created by Daniel on 19/03/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DetailViewController.h"
#import "DLMKCharacter.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

dispatch_queue_t queue;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.lbURL.text = self.detailItem.URL;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    queue = dispatch_queue_create("com.Dolmake.queueDetail", nil);
    [self configureView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.acLoadingPhoto.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoadAsync:(id)sender {
    
    self.imgPhoto.image = nil;
    self.acLoadingPhoto.hidden = NO;
    [self.acLoadingPhoto startAnimating ];
    
    dispatch_async(queue, ^{
        
        NSString* sUrl = @"http://vignette1.wikia.nocookie.net/soulcalibur/images/0/0c/Sc4-darth-vader.jpg/revision/latest?cb=20081120233924";
        NSURL* url = [NSURL URLWithString:sUrl];
        NSData* data = [NSData dataWithContentsOfURL:url];
        UIImage* image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imgPhoto.image = image;
            self.acLoadingPhoto.hidden = YES;
        });
        
    });
}


@end







