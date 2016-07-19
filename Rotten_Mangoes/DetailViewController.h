//
//  DetailViewController.h
//  Rotten_Mangoes
//
//  Created by Rene Mojica on 2016-07-18.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageViewDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelTitleDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelYearDetail;
@property (weak, nonatomic) IBOutlet UITextView *textViewSynopsisDetail;
@property (weak, nonatomic) Film *movie;

@end
