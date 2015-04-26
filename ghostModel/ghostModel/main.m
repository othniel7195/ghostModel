//
//  main.m
//  ghostModel
//
//  Created by 赵锋 on 15/4/26.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTypes.h"
#import "createModelFile.h"
#import "JSONKit.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        /* NSDictionary *dict = @{
         @"name" : OTypeString,
         @"icon" : OTypeString,
         @"age" :OTypeInt,
         @"head":OTypeDictionary,
         @"tyui":OTypeLongLong
         };
         
         
         
         [createModelFile createFileWithDict:dict folderPath:@"/Users/zhaofeng/Desktop/DICZHUANMODEL" developerName:@"赵锋" className:@"User"];
         
         
         NSArray *arrays=@[@"name",@"age",@"info",@"height",@"weight"];
         
         [createModelFile createFileWithArray:arrays folderPath:@"/Users/zhaofeng/Desktop/DICZHUANMODEL" developerName:@"赵锋" className:@"Person"];*/
        
        
        NSString *path=@"/Users/zhaofeng/Desktop/ghostModel/ghostModel/ghostModel/JSON.geojson";
        
        NSString *json=[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        NSLog(@"json :%@",json);
        //        NSDictionary *dict=[json objectFromJSONString];
        //        id value=[dict objectForKey:@"results"];
        //
        //        if ([value isKindOfClass:[NSArray class]]) {
        //            NSLog(@"array");
        //        }
        //
        //
        //        if ([value isKindOfClass:[NSString class]]) {
        //            NSLog(@"string");
        //        }
        
        [createModelFile createFileWithJson:[json objectFromJSONString] folderPath:@"/Users/zhaofeng/Desktop/ghostModel/ghostModel" developerName:@"赵锋" className:@"AAAA"];
    }
    return 0;
}
