
#import <Foundation/Foundation.h>

@interface NSObject (RuntimeUtils)

+(NSString *)getClassName;
+(NSArray *)getIvaList;
+(NSArray *)getPropertyList;
+(NSArray *)getMethodList;
+(NSArray *)getProtocolList ;
+(void)addMethod:(SEL)methodSel methodImp:(SEL)methodSelImp ;
+(void)swapFirstMethod:(SEL)method1 withSecondMethod:(SEL)method2;

@end
