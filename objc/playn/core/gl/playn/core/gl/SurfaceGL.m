//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/gl/SurfaceGL.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/InternalTransform.h"
#import "playn/core/Surface.h"
#import "playn/core/Tint.h"
#import "playn/core/gl/AbstractSurfaceGL.h"
#import "playn/core/gl/GLContext.h"
#import "playn/core/gl/GLShader.h"
#import "playn/core/gl/Scale.h"

@implementation PlaynCoreGlSurfaceGL

@synthesize width_ = width__;
@synthesize height_ = height__;
@synthesize texWidth = texWidth_;
@synthesize texHeight = texHeight_;
@synthesize tex = tex_;
@synthesize fbuf = fbuf_;

- (id)initWithPlaynCoreGlGLContext:(PlaynCoreGlGLContext *)ctx
                         withFloat:(float)width
                         withFloat:(float)height {
  if ((self = [super initWithPlaynCoreGlGLContext:ctx])) {
    self.width_ = width;
    self.height_ = height;
    self.texWidth = [((PlaynCoreGlScale *) NIL_CHK(ctx.scale_)) scaledCeilWithFloat:width];
    self.texHeight = [((PlaynCoreGlScale *) NIL_CHK(ctx.scale_)) scaledCeilWithFloat:height];
    [self createTexture];
    (void) [self scale__WithFloat:((PlaynCoreGlScale *) NIL_CHK(ctx.scale_)).factor withFloat:((PlaynCoreGlScale *) NIL_CHK(ctx.scale_)).factor];
  }
  return self;
}

- (void)destroy {
  [self clearTexture];
}

- (float)width {
  return width__;
}

- (float)height {
  return height__;
}

- (void)drawWithPlaynCoreGlGLShader:(PlaynCoreGlGLShader *)shader
     withPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>)xform
                            withInt:(int)curTint {
  if (tint_ != PlaynCoreTint_NOOP_TINT) curTint = [PlaynCoreTint combineWithInt:curTint withInt:tint_];
  [[[((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) quadShaderWithPlaynCoreGlGLShader:shader] prepareTextureWithInt:tex_ withInt:curTint] addQuadWithPlaynCoreInternalTransform:xform withFloat:0 withFloat:height__ withFloat:width__ withFloat:0 withFloat:0 withFloat:0 withFloat:1 withFloat:1];
}

- (void)createTexture {
  tex_ = [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) createTextureWithInt:texWidth_ withInt:texHeight_ withBOOL:NO withBOOL:NO withBOOL:NO];
  fbuf_ = [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) createFramebufferWithInt:tex_];
  [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) clearWithFloat:0 withFloat:0 withFloat:0 withFloat:0];
}

- (void)clearTexture {
  [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) destroyTextureWithInt:tex_];
  tex_ = 0;
  [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) deleteFramebufferWithInt:fbuf_];
  fbuf_ = 0;
}

- (void)bindFramebuffer {
  [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) bindFramebufferWithInt:fbuf_ withInt:texWidth_ withInt:texHeight_];
}

- (void)dealloc {
  if (tex_ > 0) [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) queueDestroyTextureWithInt:tex_];
  if (fbuf_ > 0) [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) queueDeleteFramebufferWithInt:fbuf_];
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreGlSurfaceGL *typedCopy = (PlaynCoreGlSurfaceGL *) copy;
  typedCopy.width_ = width__;
  typedCopy.height_ = height__;
  typedCopy.texWidth = texWidth_;
  typedCopy.texHeight = texHeight_;
  typedCopy.tex = tex_;
  typedCopy.fbuf = fbuf_;
}

@end
