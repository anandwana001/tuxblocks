//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/Layers.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Canvas.h"
#import "playn/core/CanvasImage.h"
#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/Image.h"
#import "playn/core/ImageLayer.h"
#import "playn/core/ImmediateLayer.h"
#import "playn/core/Layer.h"
#import "playn/core/PlayN.h"
#import "playn/core/canvas/CanvasSurface.h"
#import "pythagoras/f/AffineTransform.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/Point.h"
#import "pythagoras/f/Rectangle.h"
#import "pythagoras/f/Transform.h"

@implementation TripleplayUtilLayers

+ (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)from
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)to
                                withPythagorasFPoint:(PythagorasFPoint *)result {
  (void) [PlaynCoreLayer_Util layerToScreenWithPlaynCoreLayer:from withPythagorasFIPoint:p withPythagorasFPoint:result];
  (void) [PlaynCoreLayer_Util screenToLayerWithPlaynCoreLayer:to withPythagorasFIPoint:result withPythagorasFPoint:result];
  return result;
}

+ (PythagorasFPoint *)transformWithPythagorasFIPoint:(id<PythagorasFIPoint>)p
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)from
                                  withPlaynCoreLayer:(id<PlaynCoreLayer>)to {
  return [TripleplayUtilLayers transformWithPythagorasFIPoint:p withPlaynCoreLayer:from withPlaynCoreLayer:to withPythagorasFPoint:[[[PythagorasFPoint alloc] init] autorelease]];
}

+ (void)reparentWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
           withPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)target {
  PythagorasFPoint *pos = [[[PythagorasFPoint alloc] initWithFloat:[((id<PlaynCoreLayer>) NIL_CHK(layer)) tx] withFloat:[((id<PlaynCoreLayer>) NIL_CHK(layer)) ty]] autorelease];
  (void) [PlaynCoreLayer_Util layerToScreenWithPlaynCoreLayer:[((id<PlaynCoreLayer>) NIL_CHK(layer)) parent] withPythagorasFIPoint:pos withPythagorasFPoint:pos];
  [((id<PlaynCoreGroupLayer>) NIL_CHK(target)) addWithPlaynCoreLayer:layer];
  (void) [PlaynCoreLayer_Util screenToLayerWithPlaynCoreLayer:[((id<PlaynCoreLayer>) NIL_CHK(layer)) parent] withPythagorasFIPoint:pos withPythagorasFPoint:pos];
  (void) [((id<PlaynCoreLayer>) NIL_CHK(layer)) setTranslationWithFloat:((PythagorasFPoint *) NIL_CHK(pos)).x_ withFloat:((PythagorasFPoint *) NIL_CHK(pos)).y_];
}

+ (BOOL)containsWithPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)group
                     withPlaynCoreLayer:(id<PlaynCoreLayer>)layer {
  while (layer != nil) {
    layer = [((id<PlaynCoreLayer>) NIL_CHK(layer)) parent];
    if (layer == group) return YES;
  }
  return NO;
}

+ (PythagorasFRectangle *)totalBoundsWithPlaynCoreLayer:(id<PlaynCoreLayer>)root {
  PythagorasFRectangle *r = [[[PythagorasFRectangle alloc] initWithFloat:0 - [((id<PlaynCoreLayer>) NIL_CHK(root)) originX] withFloat:0 - [((id<PlaynCoreLayer>) NIL_CHK(root)) originY] withFloat:0 withFloat:0] autorelease];
  [TripleplayUtilLayers addBoundsWithPlaynCoreLayer:root withPlaynCoreLayer:root withPythagorasFRectangle:r withPythagorasFPoint:[[[PythagorasFPoint alloc] init] autorelease]];
  return r;
}

+ (void)captureWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
              withPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas {
  if (![((id<PlaynCoreLayer>) NIL_CHK(layer)) visible]) return;
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) save];
  [TripleplayUtilLayers concatTransformWithPlaynCoreCanvas:canvas withPythagorasFTransform:[((id<PlaynCoreLayer>) NIL_CHK(layer)) transform]];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) translateWithFloat:-[((id<PlaynCoreLayer>) NIL_CHK(layer)) originX] withFloat:-[((id<PlaynCoreLayer>) NIL_CHK(layer)) originY]];
  if ([(id) layer conformsToProtocol: @protocol(PlaynCoreGroupLayer)]) {
    id<PlaynCoreGroupLayer> gl = (id<PlaynCoreGroupLayer>) layer;
    for (int ii = 0, ll = [((id<PlaynCoreGroupLayer>) NIL_CHK(gl)) size]; ii < ll; ii++) {
      [TripleplayUtilLayers captureWithPlaynCoreLayer:[((id<PlaynCoreGroupLayer>) NIL_CHK(gl)) getWithInt:ii] withPlaynCoreCanvas:canvas];
    }
  }
  else if ([(id) layer conformsToProtocol: @protocol(PlaynCoreImageLayer)]) {
    id<PlaynCoreImageLayer> il = (id<PlaynCoreImageLayer>) layer;
    (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) drawImageWithPlaynCoreImage:[((id<PlaynCoreImageLayer>) NIL_CHK(il)) image] withFloat:0 withFloat:0];
  }
  else if ([(id) layer conformsToProtocol: @protocol(PlaynCoreImmediateLayer)]) {
    id<PlaynCoreImmediateLayer> il = (id<PlaynCoreImmediateLayer>) layer;
    [((id<PlaynCoreImmediateLayer_Renderer>) [((id<PlaynCoreImmediateLayer>) NIL_CHK(il)) renderer]) renderWithPlaynCoreSurface:[[[PlaynCoreCanvasCanvasSurface alloc] initWithPlaynCoreCanvas:canvas] autorelease]];
  }
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) restore];
}

+ (id<PlaynCoreCanvasImage>)captureWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
                                            withFloat:(float)width
                                            withFloat:(float)height {
  id<PlaynCoreCanvasImage> image = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createImageWithFloat:width withFloat:height];
  [TripleplayUtilLayers captureWithPlaynCoreLayer:layer withPlaynCoreCanvas:[((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]];
  return image;
}

+ (void)addBoundsWithPlaynCoreLayer:(id<PlaynCoreLayer>)root
                 withPlaynCoreLayer:(id<PlaynCoreLayer>)l
           withPythagorasFRectangle:(PythagorasFRectangle *)bounds
               withPythagorasFPoint:(PythagorasFPoint *)scratch {
  if ([(id) l conformsToProtocol: @protocol(PlaynCoreLayer_HasSize)]) {
    id<PlaynCoreLayer_HasSize> lhs = (id<PlaynCoreLayer_HasSize>) l;
    float w = [((id<PlaynCoreLayer_HasSize>) NIL_CHK(lhs)) width], h = [((id<PlaynCoreLayer_HasSize>) NIL_CHK(lhs)) height];
    if (w != 0 || h != 0) {
      [((PythagorasFRectangle *) NIL_CHK(bounds)) addWithPythagorasFIPoint:[PlaynCoreLayer_Util layerToParentWithPlaynCoreLayer:l withPlaynCoreLayer:root withPythagorasFIPoint:[((PythagorasFPoint *) NIL_CHK(scratch)) setWithFloat:0 withFloat:0] withPythagorasFPoint:scratch]];
      [((PythagorasFRectangle *) NIL_CHK(bounds)) addWithPythagorasFIPoint:[PlaynCoreLayer_Util layerToParentWithPlaynCoreLayer:l withPlaynCoreLayer:root withPythagorasFIPoint:[((PythagorasFPoint *) NIL_CHK(scratch)) setWithFloat:w withFloat:h] withPythagorasFPoint:scratch]];
    }
  }
  if ([(id) l conformsToProtocol: @protocol(PlaynCoreGroupLayer)]) {
    id<PlaynCoreGroupLayer> group = (id<PlaynCoreGroupLayer>) l;
    for (int ii = 0, ll = [((id<PlaynCoreGroupLayer>) NIL_CHK(group)) size]; ii < ll; ++ii) {
      [TripleplayUtilLayers addBoundsWithPlaynCoreLayer:root withPlaynCoreLayer:[((id<PlaynCoreGroupLayer>) NIL_CHK(group)) getWithInt:ii] withPythagorasFRectangle:bounds withPythagorasFPoint:scratch];
    }
  }
}

+ (PythagorasFAffineTransform *)toAffineWithPythagorasFTransform:(id<PythagorasFTransform>)t {
  if ([(id) t isKindOfClass:[PythagorasFAffineTransform class]]) return (PythagorasFAffineTransform *) t;
  else return [[[PythagorasFAffineTransform alloc] initWithFloat:[((id<PythagorasFTransform>) NIL_CHK(t)) scaleX] withFloat:[((id<PythagorasFTransform>) NIL_CHK(t)) scaleY] withFloat:[((id<PythagorasFTransform>) NIL_CHK(t)) rotation] withFloat:[((id<PythagorasFTransform>) NIL_CHK(t)) tx] withFloat:[((id<PythagorasFTransform>) NIL_CHK(t)) ty]] autorelease];
}

+ (void)concatTransformWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
            withPythagorasFAffineTransform:(PythagorasFAffineTransform *)at {
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) transformWithFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).m00 withFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).m01 withFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).m10 withFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).m11 withFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).tx_ withFloat:((PythagorasFAffineTransform *) NIL_CHK(at)).ty_];
}

+ (void)concatTransformWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
                  withPythagorasFTransform:(id<PythagorasFTransform>)t {
  [TripleplayUtilLayers concatTransformWithPlaynCoreCanvas:canvas withPythagorasFAffineTransform:[TripleplayUtilLayers toAffineWithPythagorasFTransform:t]];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
