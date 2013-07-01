//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/Layers.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasFAffineTransform;
@class PythagorasFPoint;
@class PythagorasFRectangle;
@protocol PlaynCoreCanvas;
@protocol PlaynCoreCanvasImage;
@protocol PlaynCoreGroupLayer;
@protocol PlaynCoreLayer;
@protocol PythagorasFIPoint;
@protocol PythagorasFTransform;

#import "JreEmulation.h"

@interface TripleplayUtilLayers : NSObject {
}

+ (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)from
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)to
                                withPythagorasFPoint:(PythagorasFPoint *)result;
+ (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)from
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)to;
+ (void)reparentWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
           withPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)target;
+ (BOOL)containsWithPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)group
                     withPlaynCoreLayer:(id<PlaynCoreLayer>)layer;
+ (PythagorasFRectangle *)totalBoundsWithPlaynCoreLayer:(id<PlaynCoreLayer>)root;
+ (void)captureWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
              withPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas;
+ (id<PlaynCoreCanvasImage>)captureWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
                                            withFloat:(float)width
                                            withFloat:(float)height;
+ (void)addBoundsWithPlaynCoreLayer:(id<PlaynCoreLayer>)root
                 withPlaynCoreLayer:(id<PlaynCoreLayer>)l
           withPythagorasFRectangle:(PythagorasFRectangle *)bounds
               withPythagorasFPoint:(PythagorasFPoint *)scratch;
+ (PythagorasFAffineTransform *)toAffineWithPythagorasFTransform:(id<PythagorasFTransform>)t;
+ (void)concatTransformWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
            withPythagorasFAffineTransform:(PythagorasFAffineTransform *)at;
+ (void)concatTransformWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
                  withPythagorasFTransform:(id<PythagorasFTransform>)t;
- (id)init;
@end
