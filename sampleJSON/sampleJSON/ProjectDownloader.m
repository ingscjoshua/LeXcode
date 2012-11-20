//
//  ProjectDownloader.m
//  sampleJSON
//
//  Created by J05u3 on 16/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "ProjectDownloader.h"

@implementation ProjectDownloader

-(NSDictionary *)downloadData{
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://bitstudio.es/proyectogt/listado.php"]];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return dict;
}
@end
