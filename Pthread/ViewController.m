//
//  ViewController.m
//  Pthread
//
//  Created by 张辉 on 2018/1/8.
//  Copyright © 2018年 Bo. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadAction:) object:@"zzzz"];//[NSThread performSelector:@selector(zzzz:) withObject:nil afterDelay:<#(NSTimeInterval)#>];
    [thread start];
    
    
    pthread_t pthread;
    pthread_create(&pthread, NULL, &pthreadMethod, nil);
}
void *pthreadMethod(void *msg){
    NSLog(@"dddd");
    return NULL;
}
-(void)threadAction:(id)sender{
    NSLog(@"zzzzzzdddddd%@",sender);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"block is in%@",[NSThread currentThread]);
        [[NSRunLoop currentRunLoop] run];
    }];
    [thread start];
    
    [self performSelector:@selector(demoIn:) onThread:thread withObject:nil waitUntilDone:NO];
}
-(void)demoIn:(id)sender{
    NSLog(@"并行");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
