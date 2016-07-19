//
//  DetailViewController.m
//  Rotten_Mangoes
//
//  Created by Rene Mojica on 2016-07-18.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.labelTitleDetail.text = self.movie.filmTitle;
    self.labelYearDetail.text = [NSString stringWithFormat: @"%@", self.movie.filmYear];
    self.textViewSynopsisDetail.text = self.movie.filmSynopsis;
    self.imageViewDetail.image = self.movie.filmThumbNail;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
