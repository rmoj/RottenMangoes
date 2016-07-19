//
//  Film.h
//  Rotten_Mangoes
//
//  Created by Rene Mojica on 2016-07-18.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Film : NSObject

@property (nonatomic, strong) NSString *filmTitle;
@property (nonatomic,strong) UIImage *filmThumbNail;
@property (nonatomic,strong) NSNumber *filmYear;
@property (nonatomic, strong) NSString *filmSynopsis;

@end
