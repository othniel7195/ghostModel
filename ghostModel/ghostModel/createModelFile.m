//
//  createModelFile.m
//  DICZHUANMODEL
//
//  Created by 赵锋 on 15-4-24.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import "createModelFile.h"
#import "OTypes.h"
#import "JSONKit.h"
@implementation createModelFile


+(NSString *)getCurrentTime
{
    //获取当前时间
    NSDate *now=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd"];
    NSString *nowString=[formatter stringFromDate:now];
    return nowString;
}

+(void)createFileWithDict:(NSDictionary *)keyValues  folderPath:(NSString *)folderPath
        developerName:(NSString *)developerName className:(NSString *)className
{
    // .h 文件创建
    //写入  说明
    NSMutableString *mutableString=[[NSMutableString alloc] init];
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    //写入 库文件名
    [mutableString appendString:@"#import <Foundation/Foundation.h> \n\n"];
    //写入接口名
    [mutableString appendFormat:@"@interface %@ : NSObject \n\n",className];

    //遍历字典所有属性
    for (NSString * keyName in keyValues) {
        
        NSString * value = keyValues[keyName];
        
        if ([value isEqualToString:OTypeString]) {
            
            [mutableString appendFormat:@"@property (nonatomic, copy) NSString * %@;\n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeInt]) {
            
            [mutableString appendFormat:@"@property (nonatomic, assign) int %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeLong]) {
            
            [mutableString appendFormat:@"@property (nonatomic, assign) long %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeLongLong]) {
            
            [mutableString appendFormat:@"@property (nonatomic, assign) long long %@; \n\n",keyName];
        }
        
        
        if ([value isEqualToString:OTypeDouble]) {
            
            [mutableString appendFormat:@"@property (nonatomic, assign) double %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeFloat]) {
            
            [mutableString appendFormat:@"@property (nonatomic, assign) float %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeArray]) {
            
            [mutableString appendFormat:@"@property (nonatomic, strong) NSArray %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeMutableArray]) {
            
            [mutableString appendFormat:@"@property (nonatomic, strong) NSMutableArray %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeDictionary]) {
            
            [mutableString appendFormat:@"@property (nonatomic, strong) NSDictionary %@; \n\n",keyName];
        }
        
        if ([value isEqualToString:OTypeMutableDictionary]) {
            
            [mutableString appendFormat:@"@property (nonatomic, strong) NSMutableDictionary %@; \n\n",keyName];
        }
    }


    [mutableString appendString:@"@end"];
    
    NSString *path_h=[NSString stringWithFormat:@"%@/%@.h",folderPath,className];

    NSError *error;

    BOOL res =  [mutableString writeToFile:path_h atomically:YES encoding:NSUTF8StringEncoding error:&error];

    if (res==NO) {
        NSLog(@"%@.h文件写入失败  error :%@",className,error);
    }
    
    
    // .m文件创建
    [mutableString setString:@""];
    
    //写入  说明
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    [mutableString appendFormat:@"#import  \"%@.h\" \n\n",className];
    [mutableString appendFormat:@"@implementation %@ \n\n",className];
    [mutableString appendString:@"@end"];
    
    NSString *path_m=[NSString stringWithFormat:@"%@/%@.m",folderPath,className];
    
    BOOL res_m =  [mutableString writeToFile:path_m atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (res_m==NO) {
        NSLog(@"%@.m文件写入失败  error :%@",className,error);
    }
}


+(void)createFileWithArray:(NSArray *)keys  folderPath:(NSString *)folderPath
             developerName:(NSString *)developerName className:(NSString *)className
{
    
    // .h 文件创建
    //写入  说明
    NSMutableString *mutableString=[[NSMutableString alloc] init];
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    //写入 库文件名
    [mutableString appendString:@"#import <Foundation/Foundation.h> \n\n"];
    //写入接口名
    [mutableString appendFormat:@"@interface %@ : NSObject \n\n",className];
    
    for (NSString *key in keys) {
        
        [mutableString appendFormat:@"@property (nonatomic, copy) NSString * %@;\n\n",key];
        
    }
    
    [mutableString appendString:@"@end"];
    
    NSString *path_h=[NSString stringWithFormat:@"%@/%@.h",folderPath,className];
    
    NSError *error;
    
    BOOL res =  [mutableString writeToFile:path_h atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (res==NO) {
        NSLog(@"%@.h文件写入失败  error :%@",className,error);
    }
    
    
    // .m文件创建
    [mutableString setString:@""];
    
    //写入  说明
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    [mutableString appendFormat:@"#import  \"%@.h\" \n\n",className];
    [mutableString appendFormat:@"@implementation %@ \n\n",className];
    [mutableString appendString:@"@end"];
    
    NSString *path_m=[NSString stringWithFormat:@"%@/%@.m",folderPath,className];
    
    BOOL res_m =  [mutableString writeToFile:path_m atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (res_m==NO) {
        NSLog(@"%@.m文件写入失败  error :%@",className,error);
    }

}

+(void)createFileWithJson:(NSDictionary *)jsonDict folderPath:(NSString *)folderPath
            developerName:(NSString *)developerName className:(NSString *)className
{
    
    // .h 文件创建
    //写入  说明
    NSMutableString *mutableString=[[NSMutableString alloc] init];
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    //写入 库文件名
    [mutableString appendString:@"#import <Foundation/Foundation.h> \n\n"];
    //写入接口名
    [mutableString appendFormat:@"@interface %@ : NSObject \n\n",className];
    
    

    for (id obj in jsonDict) {
        
        id value=[jsonDict objectForKey:obj];
        //如果value是NSString
        if ([value isKindOfClass:[NSString class]]) {
            
            [mutableString appendFormat:@"@property (nonatomic, copy) NSString * %@;\n\n",obj];

        }
        
        if ([value isKindOfClass:[NSNumber class]]) {
            
            if ([[NSString stringWithUTF8String:[value objCType]] isEqualToString:@"q"]) {
                
                [mutableString appendFormat:@"@property (nonatomic, assign) long long %@; \n\n",obj];
            }
            
            if ([[NSString stringWithUTF8String:[value objCType]] isEqualToString:@"f"]) {
                
                [mutableString appendFormat:@"@property (nonatomic, assign) float %@; \n\n",obj];
            }
            
            if ([[NSString stringWithUTF8String:[value objCType]] isEqualToString:@"d"]) {
                
                [mutableString appendFormat:@"@property (nonatomic, assign) double %@; \n\n",obj];
            }
            
            if ([[NSString stringWithUTF8String:[value objCType]] isEqualToString:@"i"]) {
                
                [mutableString appendFormat:@"@property (nonatomic, assign) int %@; \n\n",obj];
            }

        }
        
        
        //如果是数组
        if([value isKindOfClass:[NSArray class]]){
            //判断数组里面是不是字典
            [mutableString appendFormat:@"@property (nonatomic, strong) NSArray * %@;\n\n",obj];
            
            [[self class] returnDictFromArray:value folderPath:folderPath developerName:developerName className:obj];
        }
        
        //如果是字典  递归创建新的Model 要手动import 这个新的model类
        
        if([value isKindOfClass:[NSDictionary class]])
        {
            NSString *capStr = [obj capitalizedStringWithLocale:[NSLocale currentLocale]];
            [mutableString appendFormat:@"@property (nonatomic, strong) %@ * %@;\n\n",capStr,obj];
            
            [[self class] createFileWithJson:value folderPath:folderPath developerName:developerName className:capStr];
        }
        
        
    }


    [mutableString appendString:@"@end"];
    
    NSString *path_h=[NSString stringWithFormat:@"%@/%@.h",folderPath,className];
    
    NSError *error;
    
    BOOL res =  [mutableString writeToFile:path_h atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (res==NO) {
        NSLog(@"%@.h文件写入失败  error :%@",className,error);
    }
    
    
    // .m文件创建
    [mutableString setString:@""];
    
    //写入  说明
    [mutableString appendString:@"// \n"];
    [mutableString appendFormat:@"//  Created by %@ on %@. \n\n",developerName,[createModelFile getCurrentTime]];
    [mutableString appendFormat:@"#import  \"%@.h\" \n\n",className];
    [mutableString appendFormat:@"@implementation %@ \n\n",className];
    [mutableString appendString:@"@end"];
    
    NSString *path_m=[NSString stringWithFormat:@"%@/%@.m",folderPath,className];
    
    BOOL res_m =  [mutableString writeToFile:path_m atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (res_m==NO) {
        NSLog(@"%@.m文件写入失败  error :%@",className,error);
    }

}


+(void)returnDictFromArray:(id)array folderPath:(NSString *)folderPath
                       developerName:(NSString *)developerName className:(NSString *)className
{
    
    NSLog(@"array:%@",array);
    id firstObjct=[array firstObject];
    
    
    if ([firstObjct isKindOfClass:[NSArray class]]) {
        
        [[self class] returnDictFromArray:firstObjct folderPath:folderPath developerName:developerName className:className];
        
        
    }else if([firstObjct isKindOfClass:[NSDictionary class]])
    {
        NSString *capStr = [className capitalizedStringWithLocale:[NSLocale currentLocale]];
         [[self class] createFileWithJson:firstObjct folderPath:folderPath developerName:developerName className:capStr];
    }
    
}


@end
