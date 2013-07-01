//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/MenuItem.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@class PythagorasFDimension;
@class ReactSignal;
@class ReactValue;
@class TripleplayUiElement_LayoutData;
@class TripleplayUiMenuItem_ShowTextEnum;
@protocol PlaynCoreConnection;
@protocol PlaynCoreImage;
@protocol PlaynCorePointer_Event;
@protocol ReactSignalView;
@protocol TripleplayUiIcon;

#import "JreEmulation.h"
#import "java/lang/Enum.h"
#import "tripleplay/ui/TogglableTextWidget.h"

@interface TripleplayUiMenuItem : TripleplayUiTogglableTextWidget {
 @public
  ReactValue *text__;
  ReactValue *icon__;
  ReactSignal *_triggered_;
  ReactSignal *_clicked_;
  id<PlaynCoreConnection> _relay_;
  PythagorasFDimension *_preferredSize_MenuItem_;
  TripleplayUiMenuItem_ShowTextEnum *_showText_;
}

@property (nonatomic, retain) ReactValue *text_;
@property (nonatomic, retain) ReactValue *icon_;
@property (nonatomic, retain) ReactSignal *_triggered;
@property (nonatomic, retain) ReactSignal *_clicked;
@property (nonatomic, retain) id<PlaynCoreConnection> _relay;
@property (nonatomic, retain) PythagorasFDimension *_preferredSize_MenuItem;
@property (nonatomic, retain) TripleplayUiMenuItem_ShowTextEnum *_showText;

- (id)initWithNSString:(NSString *)label;
- (id)initWithNSString:(NSString *)label
    withPlaynCoreImage:(id<PlaynCoreImage>)icon;
- (id)initWithNSString:(NSString *)label
  withTripleplayUiIcon:(id<TripleplayUiIcon>)icon;
- (TripleplayUiMenuItem *)showTextWithTripleplayUiMenuItem_ShowTextEnum:(TripleplayUiMenuItem_ShowTextEnum *)value;
- (TripleplayUiMenuItem *)hideTextWhenInactive;
- (TripleplayUiMenuItem *)hideText;
- (TripleplayUiMenuItem *)setPreferredSizeWithFloat:(float)wid
                                          withFloat:(float)hei;
- (void)setRelayWithPlaynCoreConnection:(id<PlaynCoreConnection>)relay;
- (id<ReactSignalView>)triggered;
- (id<ReactSignalView>)clicked;
- (IOSClass *)getStyleClass;
- (void)onClickWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (id<TripleplayUiIcon>)icon;
- (void)onPointerStartWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event
                                       withFloat:(float)x
                                       withFloat:(float)y;
- (void)onPointerDragWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event
                                      withFloat:(float)x
                                      withFloat:(float)y;
- (void)onPointerEndWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event
                                     withFloat:(float)x
                                     withFloat:(float)y;
- (void)trigger;
- (NSString *)text;
- (TripleplayUiElement_LayoutData *)createLayoutDataWithFloat:(float)hintX
                                                    withFloat:(float)hintY;
@end

typedef enum {
  TripleplayUiMenuItem_ShowText_ALWAYS = 0,
  TripleplayUiMenuItem_ShowText_NEVER = 1,
  TripleplayUiMenuItem_ShowText_WHEN_ACTIVE = 2,
} TripleplayUiMenuItem_ShowText;

@interface TripleplayUiMenuItem_ShowTextEnum : JavaLangEnum < NSCopying > {
}
+ (TripleplayUiMenuItem_ShowTextEnum *)ALWAYS;
+ (TripleplayUiMenuItem_ShowTextEnum *)NEVER;
+ (TripleplayUiMenuItem_ShowTextEnum *)WHEN_ACTIVE;
+ (IOSObjectArray *)values;
+ (TripleplayUiMenuItem_ShowTextEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (id)initWithNSString:(NSString *)name withInt:(int)ordinal;
@end
