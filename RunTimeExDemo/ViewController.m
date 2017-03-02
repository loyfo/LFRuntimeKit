
#import "ViewController.h"
//#import "NSObject+RuntimeUtils.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSLog(@"%@",[NSObject getClassName]);
//    [LFRuntimeKit addMethod:@selector(unknowMethod) methodImp:@selector(hello) toClass:[self class]];
    [[TestClass new] test];
}

-(void)hello {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
