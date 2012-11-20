//
//  cseViewController.h
//  bombilla
//
//  Created by J05u3 on 28/08/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cseViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *bomblila;
- (IBAction)encender:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *economizador;
- (IBAction)economizadorAction:(id)sender;


@end
