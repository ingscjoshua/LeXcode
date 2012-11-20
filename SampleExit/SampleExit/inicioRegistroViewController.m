//
//  inicioRegistroViewController.m
//  SampleExit
//
//  Created by J05u3 on 15/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "inicioRegistroViewController.h"

@interface inicioRegistroViewController ()

@end

@implementation inicioRegistroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)usuarioNoRegistrado:(UIStoryboardSegue *) segue{
    
}
@end
