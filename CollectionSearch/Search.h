//
//  Food.h
//  UITableViewFilterDemo
//
//  Created by Marty Dill on 12-03-24.
//  Copyright (c) 2012 Marty Dill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Search : NSObject

@property (nonatomic, retain) NSString* brand;
@property (nonatomic, retain) NSString* status;
@property (nonatomic, retain) NSString* extra;


-(id)initWithBrandName:(NSString*)thebrandName andStatus:(NSString *)theStatus andExtra:(NSString*)theExtra;


@end
