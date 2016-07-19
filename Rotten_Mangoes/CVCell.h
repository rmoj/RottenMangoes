//
//  CVCell.h
//  Rotten_Mangoes
//
//  Created by Rene Mojica on 2016-07-18.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelYear;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
