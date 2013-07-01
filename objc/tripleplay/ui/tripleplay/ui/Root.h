//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/Root.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@class TripleplayUiElement;
@class TripleplayUiInterface;
@class TripleplayUiLayout;
@class TripleplayUiMenuHost;
@class TripleplayUiStylesheet;
@protocol PythagorasFIDimension;

#import "JreEmulation.h"
#import "tripleplay/ui/Elements.h"
#import "tripleplay/util/Destroyable.h"

@interface TripleplayUiRoot : TripleplayUiElements < TripleplayUtilDestroyable > {
 @public
  TripleplayUiInterface *_iface_;
  BOOL _valid_;
  TripleplayUiElement *_active_;
  TripleplayUiMenuHost *_menuHost_;
}

@property (nonatomic, retain) TripleplayUiInterface *_iface;
@property (nonatomic, assign) BOOL _valid;
@property (nonatomic, retain) TripleplayUiElement *_active;
@property (nonatomic, retain) TripleplayUiMenuHost *_menuHost;

- (id)initWithTripleplayUiInterface:(TripleplayUiInterface *)iface
             withTripleplayUiLayout:(TripleplayUiLayout *)layout
         withTripleplayUiStylesheet:(TripleplayUiStylesheet *)sheet;
- (TripleplayUiInterface *)iface;
- (TripleplayUiRoot *)pack;
- (TripleplayUiRoot *)packWithFloat:(float)widthHint
                          withFloat:(float)heightHint;
- (TripleplayUiRoot *)packToWidthWithFloat:(float)width;
- (TripleplayUiRoot *)packToHeightWithFloat:(float)height;
- (TripleplayUiRoot *)setSizeWithFloat:(float)width
                             withFloat:(float)height;
- (TripleplayUiRoot *)setBoundsWithFloat:(float)x
                               withFloat:(float)y
                               withFloat:(float)width
                               withFloat:(float)height;
- (void)destroy;
- (id<PythagorasFIDimension>)preferredSizeWithFloat:(float)hintX
                                          withFloat:(float)hintY;
- (void)validate;
- (IOSClass *)getStyleClass;
- (BOOL)isShowing;
- (TripleplayUiRoot *)root;
- (TripleplayUiRoot *)setAbsorbsClicksWithBOOL:(BOOL)absorbsClicks;
- (TripleplayUiMenuHost *)getMenuHost;
- (BOOL)absorbsClicks;
@end
