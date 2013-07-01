//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/Layout.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasFDimension;
@class TripleplayUiElement;
@class TripleplayUiElements;
@class TripleplayUiStyle;
@protocol PythagorasFIDimension;

#import "JreEmulation.h"

@interface TripleplayUiLayout : NSObject {
}

- (PythagorasFDimension *)computeSizeWithTripleplayUiElements:(TripleplayUiElements *)elems
                                                    withFloat:(float)hintX
                                                    withFloat:(float)hintY;
- (void)layoutWithTripleplayUiElements:(TripleplayUiElements *)elems
                             withFloat:(float)left
                             withFloat:(float)top
                             withFloat:(float)width
                             withFloat:(float)height;
- (id)resolveStyleWithTripleplayUiElement:(TripleplayUiElement *)elem
                    withTripleplayUiStyle:(TripleplayUiStyle *)style;
- (id<PythagorasFIDimension>)preferredSizeWithTripleplayUiElement:(TripleplayUiElement *)elem
                                                        withFloat:(float)hintX
                                                        withFloat:(float)hintY;
- (void)setBoundsWithTripleplayUiElement:(TripleplayUiElement *)elem
                               withFloat:(float)x
                               withFloat:(float)y
                               withFloat:(float)width
                               withFloat:(float)height;
- (id)init;
@end

@interface TripleplayUiLayout_Constraint : NSObject {
}

- (void)setElementWithTripleplayUiElement:(TripleplayUiElement *)elem;
- (void)adjustPreferredSizeWithPythagorasFDimension:(PythagorasFDimension *)psize
                                          withFloat:(float)hintX
                                          withFloat:(float)hintY;
- (id)init;
@end
