//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/DimensionValue.java
//
//  Created by Thomas on 7/1/13.
//

@protocol PythagorasFIDimension;

#import "JreEmulation.h"
#import "react/Value.h"

@interface TripleplayUtilDimensionValue : ReactValue {
}

- (id)initWithPythagorasFIDimension:(id<PythagorasFIDimension>)value;
- (id)initWithFloat:(float)width
          withFloat:(float)height;
- (void)updateWithFloat:(float)width
              withFloat:(float)height;
- (void)updateWidthWithFloat:(float)width;
- (void)updateHeightWithFloat:(float)height;
@end
