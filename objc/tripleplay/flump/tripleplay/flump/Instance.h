//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/flump/Instance.java
//
//  Created by Thomas on 7/1/13.
//

@protocol PlaynCoreLayer;

#import "JreEmulation.h"
#import "tripleplay/util/Paintable.h"

@protocol TripleplayFlumpInstance < TripleplayUtilPaintable, NSObject >
- (id<PlaynCoreLayer>)layer;
- (void)paintWithFloat:(float)dt;
@end
