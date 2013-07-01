//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/Colors.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Math.h"
#import "playn/core/Color.h"

@implementation TripleplayUtilColors

static int TripleplayUtilColors_WHITE_;
static int TripleplayUtilColors_LIGHT_GRAY_;
static int TripleplayUtilColors_GRAY_;
static int TripleplayUtilColors_DARK_GRAY_;
static int TripleplayUtilColors_BLACK_;
static int TripleplayUtilColors_RED_;
static int TripleplayUtilColors_PINK_;
static int TripleplayUtilColors_ORANGE_;
static int TripleplayUtilColors_YELLOW_;
static int TripleplayUtilColors_GREEN_;
static int TripleplayUtilColors_MAGENTA_;
static int TripleplayUtilColors_CYAN_;
static int TripleplayUtilColors_BLUE_;

+ (int)WHITE {
  return TripleplayUtilColors_WHITE_;
}

+ (int)LIGHT_GRAY {
  return TripleplayUtilColors_LIGHT_GRAY_;
}

+ (int)GRAY {
  return TripleplayUtilColors_GRAY_;
}

+ (int)DARK_GRAY {
  return TripleplayUtilColors_DARK_GRAY_;
}

+ (int)BLACK {
  return TripleplayUtilColors_BLACK_;
}

+ (int)RED {
  return TripleplayUtilColors_RED_;
}

+ (int)PINK {
  return TripleplayUtilColors_PINK_;
}

+ (int)ORANGE {
  return TripleplayUtilColors_ORANGE_;
}

+ (int)YELLOW {
  return TripleplayUtilColors_YELLOW_;
}

+ (int)GREEN {
  return TripleplayUtilColors_GREEN_;
}

+ (int)MAGENTA {
  return TripleplayUtilColors_MAGENTA_;
}

+ (int)CYAN {
  return TripleplayUtilColors_CYAN_;
}

+ (int)BLUE {
  return TripleplayUtilColors_BLUE_;
}

+ (int)blendWithInt:(int)c1
            withInt:(int)c2 {
  return [PlaynCoreColor rgbWithInt:([PlaynCoreColor redWithInt:c1] + [PlaynCoreColor redWithInt:c2]) >> 1 withInt:([PlaynCoreColor greenWithInt:c1] + [PlaynCoreColor greenWithInt:c2]) >> 1 withInt:([PlaynCoreColor blueWithInt:c1] + [PlaynCoreColor blueWithInt:c2]) >> 1];
}

+ (int)blendWithInt:(int)c1
            withInt:(int)c2
          withFloat:(float)p1 {
  float p2 = 1 - p1;
  return [PlaynCoreColor rgbWithInt:(int) ([PlaynCoreColor redWithInt:c1] * p1 + [PlaynCoreColor redWithInt:c2] * p2) withInt:(int) ([PlaynCoreColor greenWithInt:c1] * p1 + [PlaynCoreColor greenWithInt:c2] * p2) withInt:(int) ([PlaynCoreColor blueWithInt:c1] * p1 + [PlaynCoreColor blueWithInt:c2] * p2)];
}

+ (int)darkerWithInt:(int)color {
  return [PlaynCoreColor argbWithInt:[PlaynCoreColor alphaWithInt:color] withInt:[JavaLangMath maxWithInt:(int) ([PlaynCoreColor redWithInt:color] * TripleplayUtilColors_DARK_FACTOR) withInt:0] withInt:[JavaLangMath maxWithInt:(int) ([PlaynCoreColor greenWithInt:color] * TripleplayUtilColors_DARK_FACTOR) withInt:0] withInt:[JavaLangMath maxWithInt:(int) ([PlaynCoreColor blueWithInt:color] * TripleplayUtilColors_DARK_FACTOR) withInt:0]];
}

+ (int)brighterWithInt:(int)color {
  int a = [PlaynCoreColor alphaWithInt:color];
  int r = [PlaynCoreColor redWithInt:color], g = [PlaynCoreColor greenWithInt:color], b = [PlaynCoreColor blueWithInt:color];
  if (r == 0 && g == 0 && b == 0) return [PlaynCoreColor argbWithInt:a withInt:TripleplayUtilColors_MIN_BRIGHT withInt:TripleplayUtilColors_MIN_BRIGHT withInt:TripleplayUtilColors_MIN_BRIGHT];
  if (r != 0) r = [JavaLangMath maxWithInt:TripleplayUtilColors_MIN_BRIGHT withInt:r];
  if (g != 0) g = [JavaLangMath maxWithInt:TripleplayUtilColors_MIN_BRIGHT withInt:g];
  if (b != 0) b = [JavaLangMath maxWithInt:TripleplayUtilColors_MIN_BRIGHT withInt:b];
  return [PlaynCoreColor argbWithInt:a withInt:[JavaLangMath minWithInt:(int) (r * TripleplayUtilColors_BRIGHT_FACTOR) withInt:255] withInt:[JavaLangMath minWithInt:(int) (g * TripleplayUtilColors_BRIGHT_FACTOR) withInt:255] withInt:[JavaLangMath minWithInt:(int) (b * TripleplayUtilColors_BRIGHT_FACTOR) withInt:255]];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [TripleplayUtilColors class]) {
    TripleplayUtilColors_WHITE_ = [PlaynCoreColor rgbWithInt:255 withInt:255 withInt:255];
    TripleplayUtilColors_LIGHT_GRAY_ = [PlaynCoreColor rgbWithInt:192 withInt:192 withInt:192];
    TripleplayUtilColors_GRAY_ = [PlaynCoreColor rgbWithInt:128 withInt:128 withInt:128];
    TripleplayUtilColors_DARK_GRAY_ = [PlaynCoreColor rgbWithInt:64 withInt:64 withInt:64];
    TripleplayUtilColors_BLACK_ = [PlaynCoreColor rgbWithInt:0 withInt:0 withInt:0];
    TripleplayUtilColors_RED_ = [PlaynCoreColor rgbWithInt:255 withInt:0 withInt:0];
    TripleplayUtilColors_PINK_ = [PlaynCoreColor rgbWithInt:255 withInt:175 withInt:175];
    TripleplayUtilColors_ORANGE_ = [PlaynCoreColor rgbWithInt:255 withInt:200 withInt:0];
    TripleplayUtilColors_YELLOW_ = [PlaynCoreColor rgbWithInt:255 withInt:255 withInt:0];
    TripleplayUtilColors_GREEN_ = [PlaynCoreColor rgbWithInt:0 withInt:255 withInt:0];
    TripleplayUtilColors_MAGENTA_ = [PlaynCoreColor rgbWithInt:255 withInt:0 withInt:255];
    TripleplayUtilColors_CYAN_ = [PlaynCoreColor rgbWithInt:0 withInt:255 withInt:255];
    TripleplayUtilColors_BLUE_ = [PlaynCoreColor rgbWithInt:0 withInt:0 withInt:255];
  }
}

- (void)dealloc {
  [super dealloc];
}

@end
