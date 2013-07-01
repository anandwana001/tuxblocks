//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Circle.java
//
//  Created by Thomas on 7/1/13.
//

@protocol PythagorasDICircle;
@protocol PythagorasDIPoint;

#import "JreEmulation.h"
#import "java/io/Serializable.h"
#import "pythagoras/d/AbstractCircle.h"

@interface PythagorasDCircle : PythagorasDAbstractCircle < JavaIoSerializable > {
 @public
  double x__;
  double y__;
  double radius__;
}

@property (nonatomic, assign) double x_;
@property (nonatomic, assign) double y_;
@property (nonatomic, assign) double radius_;

- (id)init;
- (id)initWithDouble:(double)x
          withDouble:(double)y
          withDouble:(double)radius;
- (id)initWithPythagorasDIPoint:(id<PythagorasDIPoint>)p
                     withDouble:(double)radius;
- (id)initWithPythagorasDICircle:(id<PythagorasDICircle>)c;
- (PythagorasDCircle *)setWithPythagorasDICircle:(id<PythagorasDICircle>)c;
- (PythagorasDCircle *)setWithDouble:(double)x
                          withDouble:(double)y
                          withDouble:(double)radius;
- (double)x;
- (double)y;
- (double)radius;
@end
