//
//  DetalleViewController.h
//  sampleJSON
//
//  Created by J05u3 on 17/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleViewController : UIViewController

@property (nonatomic,strong) NSString* pruebaStr;
@property (nonatomic,strong) NSString* imageSelect;
@property (nonatomic,strong) IBOutlet UIImageView* imageView;
@property (nonatomic,strong) IBOutlet UILabel* rowNumbre;

@end
