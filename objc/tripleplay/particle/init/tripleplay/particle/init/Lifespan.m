//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/particle/init/Lifespan.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSFloatArray.h"
#import "tripleplay/particle/Initializer.h"
#import "tripleplay/particle/ParticleBuffer.h"
#import "tripleplay/util/Randoms.h"

@implementation TripleplayParticleInitLifespan

+ (TPInitializer *)constantWithFloat:(float)lifespan {
  return [[[TripleplayParticleInitLifespan_$1 alloc] initWithFloat:lifespan] autorelease];
}

+ (TPInitializer *)randomWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                         withFloat:(float)min
                                         withFloat:(float)max {
  return [[[TripleplayParticleInitLifespan_$2 alloc] initWithTripleplayUtilRandoms:rando withFloat:min withFloat:max] autorelease];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation TripleplayParticleInitLifespan_$1

@synthesize val$lifespan = val$lifespan_;

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE {
  [((IOSFloatArray *) NIL_CHK(data)) replaceFloatAtIndex:start + TPParticleBuffer_LIFESPAN withFloat:val$lifespan_];
}

- (id)initWithFloat:(float)capture$0 {
  if ((self = [super init])) {
    val$lifespan_ = capture$0;
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayParticleInitLifespan_$1 *typedCopy = (TripleplayParticleInitLifespan_$1 *) copy;
  typedCopy.val$lifespan = val$lifespan_;
}

@end
@implementation TripleplayParticleInitLifespan_$2

- (TripleplayUtilRandoms *)val$rando {
  return val$rando_;
}
- (void)setVal$rando:(TripleplayUtilRandoms *)val$rando {
  JreOperatorRetainedAssign(&val$rando_, self, val$rando);
}
@synthesize val$rando = val$rando_;
@synthesize val$min = val$min_;
@synthesize val$max = val$max_;

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE {
  [((IOSFloatArray *) NIL_CHK(data)) replaceFloatAtIndex:start + TPParticleBuffer_LIFESPAN withFloat:[((TripleplayUtilRandoms *) NIL_CHK(val$rando_)) getInRangeWithFloat:val$min_ withFloat:val$max_]];
}

- (id)initWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)capture$0
                          withFloat:(float)capture$1
                          withFloat:(float)capture$2 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&val$rando_, self, capture$0);
    val$min_ = capture$1;
    val$max_ = capture$2;
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$rando_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayParticleInitLifespan_$2 *typedCopy = (TripleplayParticleInitLifespan_$2 *) copy;
  typedCopy.val$rando = val$rando_;
  typedCopy.val$min = val$min_;
  typedCopy.val$max = val$max_;
}

@end
