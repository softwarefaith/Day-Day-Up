//
//  ViewController.m
//  GCD-Learning
//
//  Created by 蔡杰 on 16/6/10.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   // dispatch_queue_t serialQueue = dispatch_queue_create("com.allan.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t gloalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);//第一个参数：优先升级   第二个参数：预留标记为，一般设置为0
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.allan.concurrent", DISPATCH_QUEUE_CONCURRENT);
    
   
    NSString *labelString = [NSString stringWithUTF8String:dispatch_queue_get_label(concurrentQueue)];
    NSLog(@"label = %@",labelString);
    ;
    
    dispatch_sync(concurrentQueue, ^{
        
    });
    dispatch_async(concurrentQueue, ^{
        
    });
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 33ull * NSEC_PER_SEC);
   dispatch_after(time, concurrentQueue, ^{
       
   });
    
    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, 100);
    dispatch_queue_t queue = dispatch_queue_create("com.allan.qosqueue", attr);
    
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t firstQueue = dispatch_queue_create("com.starming.gcddemo.firstqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t secondQueue = dispatch_queue_create("com.starming.gcddemo.secondqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_set_target_queue(firstQueue, serialQueue);
    dispatch_set_target_queue(secondQueue, serialQueue);
    
    dispatch_async(firstQueue, ^{
        NSLog(@"1 in ");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"1 out");

    });
    dispatch_async(secondQueue, ^{
        NSLog(@"2 in");
        [NSThread sleepForTimeInterval:2.f];
         NSLog(@"2 out");
    });
    dispatch_async(secondQueue, ^{
        NSLog(@"3 in");
        [NSThread sleepForTimeInterval:1.f];
         NSLog(@"3 out");
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
