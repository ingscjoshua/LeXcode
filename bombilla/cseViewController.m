//
//  cseViewController.m
//  bombilla
//
//  Created by J05u3 on 28/08/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "cseViewController.h"

@interface cseViewController ()

@end

@implementation cseViewController
@synthesize economizador;
@synthesize bomblila;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBomblila:nil];
    [self setEconomizador:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)encender:(id)sender {
    UISwitch * interruptor=sender;
    if (interruptor.on) {
        bomblila.hidden=YES;
    } else {
        bomblila.hidden=NO;
    }
}
- (IBAction)economizador:(id)sender {
    bomblila.alpha=economizador.value;
}
- (IBAction)economizadorAction:(id)sender {
}
@end
