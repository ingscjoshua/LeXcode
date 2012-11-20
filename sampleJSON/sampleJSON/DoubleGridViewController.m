//
//  DoubleGridViewController.m
//  sampleJSON
//
//  Created by J05u3 on 16/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "DoubleGridViewController.h"
#import "ProjectDownloader.h"
#import "DetalleViewController.h"

@interface DoubleGridViewController ()

@end

@implementation DoubleGridViewController

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
    self.horizontalImgs=[[NSMutableArray alloc]init];
    self.verticalImgs=[[NSMutableArray alloc] init];
    hide=NO;
    ProjectDownloader *userData=[[ProjectDownloader alloc] init];
    NSDictionary *usersDictionary=[[NSDictionary alloc]init];
    mCachedImages=[[NSMutableDictionary alloc]init];
    imageSelected=[[UIImageView alloc]init];
    usersDictionary=[userData downloadData];
    [self.horizontalImgs addObjectsFromArray:[usersDictionary valueForKey:@"imagen"]];
    [self.verticalImgs addObjectsFromArray:[usersDictionary valueForKey:@"imagen"]];
    

}
#pragma Metodo de push
-(IBAction)pushFavoriteButton:(id)sender{
    
}

#pragma Accion para esconder el ColletionView 
- (IBAction)Hide:(id)sender {
    
}
#pragma Inicializacion Cell

#pragma CollectionView metodos de inicializacion
-(NSInteger)NumberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma Seleccion d listado horizontal o vertical
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSUInteger numCell;
    if(collectionView==self.horizontalCollectionView){
        numCell=[self.horizontalImgs count];
    }
    else if(collectionView==self.verticalCollectionView){
        numCell=[self.verticalImgs count];
    }
    return numCell;
}
#pragma Seccion de llenado
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* CellIdentifier=@"cell";
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    UICollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if(collectionView==self.horizontalCollectionView){
        UIImageView* image= [[UIImageView alloc]init];
        image.image=[mCachedImages objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        cell.backgroundView=image;
        if(image.image==nil){
            dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.horizontalImgs objectAtIndex:indexPath.row]]];
                if (data != nil) {
                    UIImage* downloadedImage=[UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (cell != nil) {
                            UIImageView* downloadedImageView=[[UIImageView alloc] init];
                            downloadedImageView.image=downloadedImage;
                            cell.backgroundView=downloadedImageView;
                        }
                        [mCachedImages setObject:downloadedImage forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
                    });
                }
            });
        }
    }
    else if(collectionView==self.verticalCollectionView){
        UIImageView* image= [[UIImageView alloc]init];
        image.image=[mCachedImages objectForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        cell.backgroundView=image;
        if(image.image==nil){
            dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                NSData* data=[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.verticalImgs objectAtIndex:indexPath.row]]];
                if (data != nil) {
                    UIImage* downloadedImage=[UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (cell != nil) {
                            UIImageView* downloadedImageView=[[UIImageView alloc] init];
                            downloadedImageView.image=downloadedImage;
                            cell.backgroundView=downloadedImageView;
                        }
                        [mCachedImages setObject:downloadedImage forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
                    });
                }
            });
        }
        
    }
    
    cell.tag=indexPath.row;
    return cell;
    
}

#pragma PrepareForSegue flujo de navegacion
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if([segue.identifier isEqualToString:@"goToDetailV"]){
            DetalleViewController* detalleViewController=(DetalleViewController *) segue.destinationViewController;
            UICollectionViewCell* collectionCell=(UICollectionViewCell *)sender;

        detalleViewController.imageSelect=[self.verticalImgs objectAtIndex:collectionCell.tag];
        detalleViewController.pruebaStr=[NSString stringWithFormat:@"%d", collectionCell.tag];
        
    }
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
