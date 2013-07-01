//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/gl/ImageRegionGL.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "IOSIntArray.h"
#import "java/lang/AssertionError.h"
#import "java/lang/Throwable.h"
#import "java/lang/UnsupportedOperationException.h"
#import "playn/core/Image.h"
#import "playn/core/InternalTransform.h"
#import "playn/core/Pattern.h"
#import "playn/core/Tint.h"
#import "playn/core/gl/AbstractImageGL.h"
#import "playn/core/gl/GLContext.h"
#import "playn/core/gl/GLShader.h"
#import "playn/core/gl/GLUtil.h"
#import "playn/core/gl/Scale.h"
#import "playn/core/util/Callback.h"

@implementation PlaynCoreGlImageRegionGL

- (PlaynCoreGlAbstractImageGL *)parent_ {
  return parent__;
}
- (void)setParent_:(PlaynCoreGlAbstractImageGL *)parent_ {
  JreOperatorRetainedAssign(&parent__, self, parent_);
}
@synthesize parent_ = parent__;
@synthesize x_ = x__;
@synthesize y_ = y__;
@synthesize width_ = width__;
@synthesize height_ = height__;
@synthesize tex = tex_;

- (id)initWithPlaynCoreGlAbstractImageGL:(PlaynCoreGlAbstractImageGL *)parent
                               withFloat:(float)x
                               withFloat:(float)y
                               withFloat:(float)width
                               withFloat:(float)height {
  if ((self = [super initWithPlaynCoreGlGLContext:((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent)).ctx])) {
    self.parent_ = parent;
    self.x_ = x;
    self.y_ = y;
    self.width_ = width;
    self.height_ = height;
  }
  return self;
}

- (PlaynCoreGlScale *)scale__ {
  return [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) scale__];
}

- (int)ensureTexture {
  if (![self isReady]) {
    return 0;
  }
  else if (repeatX__ || repeatY__) {
    return (tex_ > 0) ? tex_ : (tex_ = [self scaleTexture]);
  }
  else {
    return [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) ensureTexture];
  }
}

- (void)clearTexture {
  if (tex_ > 0) {
    [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) destroyTextureWithInt:tex_];
    tex_ = 0;
  }
}

- (void)reference {
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) reference];
}

- (void)release__ {
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) release__];
}

- (float)x {
  return x__;
}

- (float)y {
  return y__;
}

- (float)width {
  return width__;
}

- (float)height {
  return height__;
}

- (void)setBoundsWithFloat:(float)x
                 withFloat:(float)y
                 withFloat:(float)width
                 withFloat:(float)height {
  self.x_ = x;
  self.y_ = y;
  self.width_ = width;
  self.height_ = height;
}

- (id<PlaynCoreImage>)parent {
  return parent__;
}

- (BOOL)isReady {
  return [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) isReady];
}

- (void)addCallbackWithPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)callback {
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) addCallbackWithPlaynCoreUtilCallback:[[[PlaynCoreGlImageRegionGL_$1 alloc] initWithPlaynCoreGlImageRegionGL:self withPlaynCoreUtilCallback:callback] autorelease]];
}

- (id<PlaynCoreImage_Region>)subImageWithFloat:(float)x
                                     withFloat:(float)y
                                     withFloat:(float)width
                                     withFloat:(float)height {
  return [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) subImageWithFloat:[self x] + x withFloat:[self y] + y withFloat:width withFloat:height];
}

- (id<PlaynCorePattern>)toPattern {
  return [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) toSubPatternWithPlaynCoreGlAbstractImageGL:self withBOOL:repeatX__ withBOOL:repeatY__ withFloat:x__ withFloat:y__ withFloat:width__ withFloat:height__];
}

- (void)getRgbWithInt:(int)startX
              withInt:(int)startY
              withInt:(int)width
              withInt:(int)height
withJavaLangIntegerArray:(IOSIntArray *)rgbArray
              withInt:(int)offset
              withInt:(int)scanSize {
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) getRgbWithInt:startX + (int) x__ withInt:startY + (int) y__ withInt:width withInt:height withJavaLangIntegerArray:rgbArray withInt:offset withInt:scanSize];
}

- (id<PlaynCoreImage>)transformWithPlaynCoreImage_BitmapTransformer:(id<PlaynCoreImage_BitmapTransformer>)xform {
  @throw [[[JavaLangUnsupportedOperationException alloc] initWithNSString:@"Cannot transform subimages. Transform the parent and then obtain a subimage of that."] autorelease];
}

- (void)drawWithId:(id)gc
         withFloat:(float)dx
         withFloat:(float)dy
         withFloat:(float)dw
         withFloat:(float)dh {
  [self drawWithId:gc withFloat:dx withFloat:dy withFloat:dw withFloat:dh withFloat:0 withFloat:0 withFloat:width__ withFloat:height__];
}

- (void)drawWithId:(id)gc
         withFloat:(float)dx
         withFloat:(float)dy
         withFloat:(float)dw
         withFloat:(float)dh
         withFloat:(float)sx
         withFloat:(float)sy
         withFloat:(float)sw
         withFloat:(float)sh {
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) drawWithId:gc withFloat:dx withFloat:dy withFloat:dw withFloat:dh withFloat:x__ + sx withFloat:y__ + sy withFloat:sw withFloat:sh];
}

- (void)drawWithPlaynCoreGlGLShader:(PlaynCoreGlGLShader *)shader
     withPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>)xform
                            withInt:(int)tint
                          withFloat:(float)dx
                          withFloat:(float)dy
                          withFloat:(float)dw
                          withFloat:(float)dh
                          withFloat:(float)sx
                          withFloat:(float)sy
                          withFloat:(float)sw
                          withFloat:(float)sh {
  float texWidth = (tex_ > 0) ? width__ : [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) width];
  float texHeight = (tex_ > 0) ? height__ : [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) height];
  sx += [self x];
  sy += [self y];
  [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) drawImplWithPlaynCoreGlGLShader:shader withPlaynCoreInternalTransform:xform withInt:[self ensureTexture] withInt:tint withFloat:dx withFloat:dy withFloat:dw withFloat:dh withFloat:sx / texWidth withFloat:sy / texHeight withFloat:(sx + sw) / texWidth withFloat:(sy + sh) / texHeight];
}

- (id<PlaynCorePattern>)toSubPatternWithPlaynCoreGlAbstractImageGL:(PlaynCoreGlAbstractImageGL *)image
                                                          withBOOL:(BOOL)repeatX
                                                          withBOOL:(BOOL)repeatY
                                                         withFloat:(float)x
                                                         withFloat:(float)y
                                                         withFloat:(float)width
                                                         withFloat:(float)height {
  @throw [[[JavaLangAssertionError alloc] init] autorelease];
}

- (int)scaleTexture {
  int scaledWidth = [[self scale__] scaledCeilWithFloat:self.width_];
  int scaledHeight = [[self scale__] scaledCeilWithFloat:self.height_];
  int width = [PlaynCoreGlGLUtil nextPowerOfTwoWithInt:scaledWidth], height = [PlaynCoreGlGLUtil nextPowerOfTwoWithInt:scaledHeight];
  if (width == 0) width = scaledWidth;
  if (height == 0) height = scaledHeight;
  int tex = [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) ensureTexture];
  int reptex = [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) createTextureWithInt:width withInt:height withBOOL:repeatX__ withBOOL:repeatY__ withBOOL:mipmapped_];
  int fbuf = [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) createFramebufferWithInt:reptex];
  [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) pushFramebufferWithInt:fbuf withInt:width withInt:height];
  @try {
    [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) clearWithFloat:0 withFloat:0 withFloat:0 withFloat:0];
    float tw = [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) width], th = [((PlaynCoreGlAbstractImageGL *) NIL_CHK(parent__)) height];
    float sl = self.x_, st = self.y_, sr = sl + self.width_, sb = st + self.height_;
    PlaynCoreGlGLShader *shader = [[((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) quadShaderWithPlaynCoreGlGLShader:nil] prepareTextureWithInt:tex withInt:PlaynCoreTint_NOOP_TINT];
    [((PlaynCoreGlGLShader *) NIL_CHK(shader)) addQuadWithPlaynCoreInternalTransform:[((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) createTransform] withFloat:0 withFloat:height withFloat:width withFloat:0 withFloat:sl / tw withFloat:st / th withFloat:sr / tw withFloat:sb / th];
    [((PlaynCoreGlGLShader *) NIL_CHK(shader)) flush];
    if (mipmapped_) [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) generateMipmapWithInt:reptex];
    return reptex;
  }
  @finally {
    [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) popFramebuffer];
    [((PlaynCoreGlGLContext *) NIL_CHK(ctx_)) deleteFramebufferWithInt:fbuf];
  }
}

- (void)dealloc {
  JreOperatorRetainedAssign(&parent__, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreGlImageRegionGL *typedCopy = (PlaynCoreGlImageRegionGL *) copy;
  typedCopy.parent_ = parent__;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
  typedCopy.width_ = width__;
  typedCopy.height_ = height__;
  typedCopy.tex = tex_;
}

@end
@implementation PlaynCoreGlImageRegionGL_$1

- (PlaynCoreGlImageRegionGL *)this$0 {
  return this$0_;
}
- (void)setThis$0:(PlaynCoreGlImageRegionGL *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (id<PlaynCoreUtilCallback>)val$callback {
  return val$callback_;
}
- (void)setVal$callback:(id<PlaynCoreUtilCallback>)val$callback {
  JreOperatorRetainedAssign(&val$callback_, self, val$callback);
}
@synthesize val$callback = val$callback_;

- (void)onSuccessWithId:(id<PlaynCoreImage>)image {
  [((id<PlaynCoreUtilCallback>) NIL_CHK(val$callback_)) onSuccessWithId:this$0_];
}

- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)err {
  [((id<PlaynCoreUtilCallback>) NIL_CHK(val$callback_)) onFailureWithJavaLangThrowable:err];
}

- (id)initWithPlaynCoreGlImageRegionGL:(PlaynCoreGlImageRegionGL *)outer$
             withPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$callback_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$callback_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreGlImageRegionGL_$1 *typedCopy = (PlaynCoreGlImageRegionGL_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$callback = val$callback_;
}

@end
