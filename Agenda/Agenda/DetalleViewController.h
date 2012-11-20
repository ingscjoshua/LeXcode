//
//  DetalleViewController.h
//  Agenda
//
//  Created by J05u3 on 03/10/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacto.h"

@interface DetalleViewController : UIViewController



@property (nonatomic,strong)IBOutlet UILabel * nombreLabel;
@property(nonatomic,strong)IBOutlet UILabel * apellidosLabel;
@property (nonatomic,strong) Contacto *contacto;


@end
