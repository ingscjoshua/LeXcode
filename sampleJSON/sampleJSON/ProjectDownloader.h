//
//  ProjectDownloader.h
//  sampleJSON
//
//  Created by J05u3 on 16/11/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectDownloader : NSObject{
    NSURLConnection *mConnection;
    NSMutableData *mRecivedData;
    NSMutableString *mCurrentString;
}
-(NSDictionary *) downloadData;

@end
