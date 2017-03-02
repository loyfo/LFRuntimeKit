
#import "NSObject+RuntimeUtils.h"
#import "LFRuntimeKit.h"

@implementation NSObject (RuntimeUtils)

+(NSString *)getClassName {
    return [LFRuntimeKit fetchClassName:self];
}

+(NSArray *)getIvaList {
   return [LFRuntimeKit fetchIvaList:self];
}

+(NSArray *)getPropertyList{
   return [LFRuntimeKit fetchPropertyList:self];
}

+(NSArray *)getMethodList {
   return [LFRuntimeKit fetchMethodList:self];
}

+(NSArray *)getProtocolList {
    return [LFRuntimeKit fetchProtocolList:self];
}

+(void)addMethod:(SEL)methodSel methodImp:(SEL)methodSelImp {
    [LFRuntimeKit addMethod:methodSel methodImp:methodSelImp toClass:self];
}

+(void)swapFirstMethod:(SEL)method1 withSecondMethod:(SEL)method2 {
    [LFRuntimeKit methodSwap:self firstMethod:method1 secondMethod:method2];
}




@end
