//
//  NSData+YDAvoidCrash.m
//  YDKitDemo
//
//  Created by 王远东 on 2021/9/25.
//

#import "NSData+YDAvoidCrash.h"
#import "YDAvoidCrash.h"
#import "NSObject+YDAvoidCrashRunTime.h"

@implementation NSData (YDAvoidCrash)

+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteData = NSClassFromString(@"NSConcreteData");
        
        //=================
        //   class method
        //=================
        [NSObject exchangeClassMethod:[self class] method1Sel:@selector(dataWithContentsOfFile:) method2Sel:@selector(avoidDataWithContentsOfFile:)];
        
        [NSObject exchangeClassMethod:[self class] method1Sel:@selector(dataWithData:) method2Sel:@selector(avoidDataWithData:)];
        
        [NSObject exchangeClassMethod:[self class] method1Sel:@selector(dataWithContentsOfURL:) method2Sel:@selector(avoidDataWithContentsOfURL:)];
        
        
        //====================
        //   instance method
        //====================
        [NSObject exchangeInstanceMethod:NSConcreteData method1Sel:@selector(initWithData:) method2Sel:@selector(avoidInitWithData:)];
        [NSObject exchangeInstanceMethod:NSConcreteData method1Sel:@selector(initWithBytes:length:) method2Sel:@selector(initWithBytes:length:)];
        [NSObject exchangeInstanceMethod:NSConcreteData method1Sel:@selector(initWithContentsOfFile:) method2Sel:@selector(avoidInitWithContentsOfURL:)];
        [NSObject exchangeInstanceMethod:NSConcreteData method1Sel:@selector(initWithContentsOfURL:) method2Sel:@selector(avoidInitWithContentsOfURL:)];
        
    });

}

+ (instancetype)avoidDataWithContentsOfFile:(NSString *)path {
    id instance = nil;
    
    @try {
        instance = [self avoidDataWithContentsOfFile:path];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to [NSData new]";
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        instance = [self new];
    }
    @finally {
        return instance;
    }
}

+ (instancetype)avoidDataWithData:(NSData *)data {
    id instance = nil;
    
    @try {
        instance = [self avoidDataWithData:data];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to [NSData new]";
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        instance = [self new];
    }
    @finally {
        return instance;
    }
}

+ (instancetype)avoidDataWithContentsOfURL:(NSURL *)url {
    id instance = nil;
    
    @try {
        instance = [self avoidDataWithContentsOfURL:url];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"This framework default is to [NSData new]";
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        instance = [self new];
    }
    @finally {
        return instance;
    }
}

- (instancetype)avoidInitWithData:(NSData *)data {
    id object = nil;
    
    @try {
        object = [self avoidInitWithData:data];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = @"This framework default is to [self init]";;
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        object = [self init];
    }
    @finally {
        return object;
    }
}

- (instancetype)avoidInitWithBytes:(const void *)bytes length:(NSUInteger)length {
    id object = nil;
    
    @try {
        object = [self avoidInitWithBytes:bytes length:length];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = @"This framework default is to [self init]";;
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        object = [self init];
    }
    @finally {
        return object;
    }
}

- (instancetype)avoidInitWithContentsOfFile:(NSString *)path {
    id object = nil;
    
    @try {
        object = [self avoidInitWithContentsOfFile:path];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = @"This framework default is to [self init]";;
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        object = [self init];
    }
    @finally {
        return object;
    }
}

- (instancetype)avoidInitWithContentsOfURL:(NSURL *)url {
    id object = nil;
    
    @try {
        object = [self avoidInitWithContentsOfURL:url];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = @"This framework default is to [self init]";;
        [YDAvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}

@end
