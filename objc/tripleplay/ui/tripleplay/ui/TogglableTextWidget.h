//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/TogglableTextWidget.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangBoolean;
@class ReactValue;
@protocol PlaynCorePointer_Event;
@protocol ReactSignalView;

#import "JreEmulation.h"
#import "react/Slot.h"
#import "tripleplay/ui/ClickableTextWidget.h"
#import "tripleplay/ui/Togglable.h"

@interface TripleplayUiTogglableTextWidget : TripleplayUiClickableTextWidget < TripleplayUiTogglable > {
 @public
  ReactValue *selected__;
  BOOL _anchorState_;
}

@property (nonatomic, retain) ReactValue *selected_;
@property (nonatomic, assign) BOOL _anchorState;

- (ReactValue *)selected;
- (id)init;
- (void)onPressWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (void)onHoverWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event
                                 withBOOL:(BOOL)inBounds;
- (void)onReleaseWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (void)onCancelWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (id<ReactSignalView>)clicked;
@end

@interface TripleplayUiTogglableTextWidget_$1 : ReactSlot {
 @public
  TripleplayUiTogglableTextWidget *this$0_;
}

@property (nonatomic, retain) TripleplayUiTogglableTextWidget *this$0;

- (void)onEmitWithId:(JavaLangBoolean *)selected;
- (id)initWithTripleplayUiTogglableTextWidget:(TripleplayUiTogglableTextWidget *)outer$;
@end
