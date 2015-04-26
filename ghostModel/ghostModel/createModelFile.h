//
//  createModelFile.h
//  DICZHUANMODEL
//
//  Created by 赵锋 on 15-4-24.
//  Copyright (c) 2015年 赵锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface createModelFile : NSObject


/**
 *  通过字典来创建模型的 .h 和 .m 文件
 *  可定义属性类型
 *  @param keyValues 字典
 *  @param folderPath 写入文件的文件夹路径
 */
+(void)createFileWithDict:(NSDictionary *)keyValues  folderPath:(NSString *)folderPath
        developerName:(NSString *)developerName className:(NSString *)className;


/**
 *  通过数组来创建模型的 .h 和 .m 文件
 *  属性都是NSString类型
 *  @param keys 数组
 *  @param folderPath 写入文件的文件夹路径
 */
+(void)createFileWithArray:(NSArray *)keys  folderPath:(NSString *)folderPath
                   developerName:(NSString *)developerName className:(NSString *)className;

/**
 *  通过复杂的json格式创建模型 .h 和 .m 文件
 *  @param json信息
 *  @param folderPath 写入文件的文件夹路径
 */
+(void)createFileWithJson:(NSString *)json folderPath:(NSString *)folderPath
            developerName:(NSString *)developerName className:(NSString *)className;

@end
