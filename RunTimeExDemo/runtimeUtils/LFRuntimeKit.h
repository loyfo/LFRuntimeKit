//
//  LFRuntimeKit.h
//  RunTimeExDemo
//
//  Created by 黄维平 on 2017/3/1.
//  Copyright © 2017年 UFotoSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFRuntimeKit : NSObject

/**
 获取类名
 
 @param class 相应类
 @return NSSting*: 类名
 */
+ (NSString *)fetchClassName:(Class)class;


/**
 获取类的所有成员变量
 
 @param class 相应类
 @return 成员变量数组
 */
+ (NSArray *)fetchIvaList:(Class)class;


/**
 获取类的所有属性,包括私有和公有属性，及定义在延展中的属性
 
 @param class 相应类
 @return 属性列表数组
 */
+ (NSArray *)fetchPropertyList:(Class)class;


/**
 获取类的所有实例方法
 
 @param class 相应类
 @return 实例方法列表数组
 */
+ (NSArray *)fetchMethodList:(Class)class;


/**
 获取类的遵循的协议列表
 
 @param class 相应类
 @return 协议列表数组
 */
+ (NSArray *)fetchProtocolList:(Class)class;


/**
 向指定类添加方法
 
 @param methodSel 方法名
 @param methodSelImp 方法实现名
 @param class 指定类
 */
+ (void)addMethod:(SEL)methodSel methodImp:(SEL)methodSelImp toClass:(Class)class;


/**
 向指定类添加方法
 
 @param method1 方法1
 @param method2 方法2
 */
+ (void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2;


@end
