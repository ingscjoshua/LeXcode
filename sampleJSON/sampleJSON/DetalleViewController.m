//
//  DetalleViewController.m
//  sampleJSON
//
//  Created by J05u3 on 17/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "DetalleViewController.h"

@interface DetalleViewController ()

@end

@implementation DetalleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
#pragma Metodo de carga de la ventana
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.rowNumbre.text=self.pruebaStr;
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageSelect]];
   
        if(data !=nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image=[UIImage imageWithData:data];
            });
        
        }
    });
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
