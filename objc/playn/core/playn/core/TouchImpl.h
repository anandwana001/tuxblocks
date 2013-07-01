//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/TouchImpl.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSObjectArray;
@class PlaynCoreTouch_Event_Impl;
@protocol JavaUtilMap;
@protocol PlaynCoreDispatcher;
@protocol PlaynCoreLayer;
@protocol PlaynCoreTouch_LayerListener;
@protocol PlaynCoreTouch_Listener;

#import "JreEmulation.h"
#import "playn/core/AbstractLayer.h"
#import "playn/core/Touch.h"

@interface PlaynCoreTouchImpl : NSObject < PlaynCoreTouch > {
 @public
  BOOL enabled_;
  id<PlaynCoreDispatcher> dispatcher_;
  id<PlaynCoreTouch_Listener> listener__;
  id<JavaUtilMap> activeLayers_;
}

@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, retain) id<PlaynCoreDispatcher> dispatcher;
@property (nonatomic, retain) id<PlaynCoreTouch_Listener> listener_;
@property (nonatomic, retain) id<JavaUtilMap> activeLayers;

+ (id<PlaynCoreAbstractLayer_Interaction>)START;
+ (void)setSTART:(id<PlaynCoreAbstractLayer_Interaction>)START;
+ (id<PlaynCoreAbstractLayer_Interaction>)MOVE;
+ (void)setMOVE:(id<PlaynCoreAbstractLayer_Interaction>)MOVE;
+ (id<PlaynCoreAbstractLayer_Interaction>)END;
+ (void)setEND:(id<PlaynCoreAbstractLayer_Interaction>)END;
+ (id<PlaynCoreAbstractLayer_Interaction>)CANCEL;
+ (void)setCANCEL:(id<PlaynCoreAbstractLayer_Interaction>)CANCEL;
- (BOOL)hasTouch;
- (BOOL)isEnabled;
- (void)setEnabledWithBOOL:(BOOL)enabled;
- (id<PlaynCoreTouch_Listener>)listener;
- (void)setListenerWithPlaynCoreTouch_Listener:(id<PlaynCoreTouch_Listener>)listener;
- (void)cancelLayerTouchesWithPlaynCoreLayer:(id<PlaynCoreLayer>)except;
- (void)setPropagateEventsWithBOOL:(BOOL)propagate;
- (void)onTouchStartWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches;
- (void)onTouchMoveWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches;
- (void)onTouchEndWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches;
- (void)onTouchCancelWithPlaynCoreTouch_Event_ImplArray:(IOSObjectArray *)touches;
- (id)init;
@end

@interface PlaynCoreTouchImpl_$1 : NSObject < PlaynCoreAbstractLayer_Interaction > {
}

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev;
- (id)init;
@end

@interface PlaynCoreTouchImpl_$2 : NSObject < PlaynCoreAbstractLayer_Interaction > {
}

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev;
- (id)init;
@end

@interface PlaynCoreTouchImpl_$3 : NSObject < PlaynCoreAbstractLayer_Interaction > {
}

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev;
- (id)init;
@end

@interface PlaynCoreTouchImpl_$4 : NSObject < PlaynCoreAbstractLayer_Interaction > {
}

- (void)interactWithId:(id<PlaynCoreTouch_LayerListener>)l
                withId:(PlaynCoreTouch_Event_Impl *)ev;
- (id)init;
@end
