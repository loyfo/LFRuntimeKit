
#import "LFRuntimeKit.h"
#import <objc/runtime.h>

@implementation LFRuntimeKit

+(NSString *)fetchClassName:(Class)class {
    const char *className = class_getName(class);
    return [NSString stringWithUTF8String:className];
}

+(NSArray *)fetchIvaList:(Class)class {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(class, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"ivarName"] = [NSString stringWithUTF8String:ivarName];
        dic[@"type"] = [NSString stringWithUTF8String:ivarType];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}

+(NSArray *)fetchPropertyList:(Class)class {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        const char *porpertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String:porpertyName]];
    }
    free(propertyList);
    return [mutableList copy];
}

+(NSArray *)fetchMethodList:(Class)class {
    unsigned int count = 0;
    Method *MethodList = class_copyMethodList(class, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Method method = MethodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(MethodList);
    return [mutableList copy];
}

+(NSArray *)fetchProtocolList:(Class)class {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(class, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        Protocol * protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String:protocolName]];
    }
    return [mutableList copy];
}

+(void)addMethod:(SEL)methodSel methodImp:(SEL)methodSelImp toClass:(Class)class {
    Method method = class_getInstanceMethod(class,methodSelImp);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(class, methodSel, methodIMP, types);
}


+(void)methodSwap:(Class)class firstMethod:(SEL)method1 secondMethod:(SEL)method2 {
    Method firstMethod = class_getInstanceMethod(class, method1);
    Method secondMethod = class_getInstanceMethod(class, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
}


/*TODO:拦截消息处理，防止在未找到方法时崩溃
+(BOOL)resolveInstanceMethod:(SEL)sel {
    if (![super resolveInstanceMethod:sel]) {
         [LFRuntimeKit addMethod:sel methodImp:@selector(dynamicAddMethod:) toClass:NSClassFromString(@"LFRuntimeKit")];
    }
    return YES;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature =[super methodSignatureForSelector:aSelector];
    if (signature == nil) {
        signature = [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
    return signature;
}

-(void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL aSelector = [anInvocation selector];
    
    if ([self respondsToSelector:aSelector]) {
        [anInvocation invokeWithTarget:self];
    }
}
 
 -(void)dynamicAddMethod:(NSString *)value {
 //    NSLog(@"'%@'类的 \"%@\" 方法未找到!",[self class],value);
 }
*/

@end
