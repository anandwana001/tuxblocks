//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/gl/GLUtil.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Asserts.h"

@implementation PlaynCoreGlGLUtil

+ (int)nextPowerOfTwoWithInt:(int)x {
  [PlaynCoreAsserts checkArgumentWithBOOL:x < (int) 0x10000];
  int bit = (int) 0x8000, highest = -1, count = 0;
  for (int i = 15; i >= 0; --i, bit >>= 1) {
    if ((x & bit) != 0) {
      ++count;
      if (highest == -1) {
        highest = i;
      }
    }
  }
  if (count <= 1) {
    return 0;
  }
  return 1 << (highest + 1);
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
