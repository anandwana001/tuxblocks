//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/PathIterator.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSDoubleArray;

#import "JreEmulation.h"

#define PythagorasDPathIterator_SEG_CLOSE 4
#define PythagorasDPathIterator_SEG_CUBICTO 3
#define PythagorasDPathIterator_SEG_LINETO 1
#define PythagorasDPathIterator_SEG_MOVETO 0
#define PythagorasDPathIterator_SEG_QUADTO 2
#define PythagorasDPathIterator_WIND_EVEN_ODD 0
#define PythagorasDPathIterator_WIND_NON_ZERO 1

@protocol PythagorasDPathIterator < NSObject >
- (int)windingRule;
- (BOOL)isDone;
- (void)next;
- (int)currentSegmentWithJavaLangDoubleArray:(IOSDoubleArray *)coords;
@end

@interface PythagorasDPathIterator : NSObject {
}
+ (int)WIND_EVEN_ODD;
+ (int)WIND_NON_ZERO;
+ (int)SEG_MOVETO;
+ (int)SEG_LINETO;
+ (int)SEG_QUADTO;
+ (int)SEG_CUBICTO;
+ (int)SEG_CLOSE;
@end
