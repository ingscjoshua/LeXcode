//
//  DoubleGridViewController.h
//  sampleJSON
//
//  Created by J05u3 on 16/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class AppDelegate;

@interface DoubleGridViewController : UIViewController{
    AppDelegate *mAppDelegate;
    int num;
    UIImageView *imageSelected;
    BOOL hide;
    NSMutableDictionary *mCachedImages;
}

@property (nonatomic,strong)NSMutableArray *horizontalImgs;
@property (nonatomic,strong)NSMutableArray *verticalImgs;
@property (nonatomic,strong)IBOutlet UICollectionView *horizontalCollectionView;
@property (nonatomic,strong)IBOutlet UICollectionView *verticalCollectionView;
@property (nonatomic,strong)IBOutlet UIView *favoriteView;

-(IBAction)pushFavoriteButton:(id)sender;
- (IBAction)Hide:(id)sender;

@end
