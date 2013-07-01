//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/gl/LayerGL.java
//
//  Created by Thomas on 7/1/13.
//

@class PlaynCoreGlGLContext;
@class PlaynCoreGlGLShader;
@protocol PlaynCoreInternalTransform;
@protocol PlaynCoreLayer;

#import "JreEmulation.h"
#import "playn/core/AbstractLayer.h"

@interface PlaynCoreGlLayerGL : PlaynCoreAbstractLayer {
 @public
  id<PlaynCoreInternalTransform> savedLocal_;
  PlaynCoreGlGLContext *ctx_;
  PlaynCoreGlGLShader *shader_;
}

@property (nonatomic, retain) id<PlaynCoreInternalTransform> savedLocal;
@property (nonatomic, retain) PlaynCoreGlGLContext *ctx;
@property (nonatomic, retain) PlaynCoreGlGLShader *shader;

- (id<PlaynCoreLayer>)setShaderWithPlaynCoreGlGLShader:(PlaynCoreGlGLShader *)shader;
- (void)destroy;
- (id)initWithPlaynCoreGlGLContext:(PlaynCoreGlGLContext *)ctx;
- (id<PlaynCoreInternalTransform>)localTransformWithPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>)parentTransform;
- (void)paintWithPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>)curTransform
                                    withInt:(int)curTint
                    withPlaynCoreGlGLShader:(PlaynCoreGlGLShader *)curShader;
@end
