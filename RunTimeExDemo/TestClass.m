
#import "TestClass.h"
#import "NSObject+RuntimeUtils.h"

@implementation TestClass

-(void)test {
    [[self class]swapFirstMethod:@selector(one) withSecondMethod:@selector(two)];
    [[self class]addMethod:@selector(second) methodImp:@selector(first)];
    [self performSelector:@selector(one)];
    [self performSelector:@selector(second)];
}

-(void)two {
    NSLog(@"two");
}

-(void)one {
    NSLog(@"one");
}

-(void)first {
    NSLog(@"First");
}
@end
