//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/particle/init/Color.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSFloatArray;

#import "JreEmulation.h"
#import "tripleplay/particle/Initializer.h"

@interface TripleplayParticleInitColor : NSObject {
}

+ (TPInitializer *)constantWithInt:(int)argb;
+ (TPInitializer *)constantWithFloat:(float)r
                           withFloat:(float)g
                           withFloat:(float)b
                           withFloat:(float)a;
- (id)init;
@end

@interface TripleplayParticleInitColor_$1 : TPInitializer {
 @public
  float val$r_;
  float val$g_;
  float val$b_;
  float val$a_;
}

@property (nonatomic, assign) float val$r;
@property (nonatomic, assign) float val$g;
@property (nonatomic, assign) float val$b;
@property (nonatomic, assign) float val$a;

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE;
- (id)initWithFloat:(float)capture$0
          withFloat:(float)capture$1
          withFloat:(float)capture$2
          withFloat:(float)capture$3;
@end
