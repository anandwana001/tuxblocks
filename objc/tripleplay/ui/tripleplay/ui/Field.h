//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/Field.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@class JavaLangBoolean;
@class JavaLangThrowable;
@class PlaynCoreKeyboard_TextTypeEnum;
@class PythagorasFRectangle;
@class ReactSignal;
@class ReactValue;
@class TripleplayUiElement_LayoutData;
@class TripleplayUiStyle;
@class TripleplayUiStyle_Flag;
@class TripleplayUiStyles;
@protocol PlaynCorePointer_Event;
@protocol ReactSignalView;
@protocol TripleplayPlatformNativeTextField;
@protocol TripleplayUiIcon;

#import "JreEmulation.h"
#import "playn/core/util/Callback.h"
#import "react/Slot.h"
#import "tripleplay/platform/NativeTextField.h"
#import "tripleplay/ui/TextWidget.h"

@interface TripleplayUiField : TripleplayUiTextWidget {
 @public
  ReactValue *text__;
  id<TripleplayPlatformNativeTextField> _nativeField_;
  id<TripleplayPlatformNativeTextField_Transformer> _defaultTransformer_;
  id<TripleplayPlatformNativeTextField_Validator> _defaultValidator_;
  ReactSignal *_finishedEditing_;
  NSString *_popupLabel_;
  int _maxFieldLength_;
}

@property (nonatomic, retain) ReactValue *text_;
@property (nonatomic, retain) id<TripleplayPlatformNativeTextField> _nativeField;
@property (nonatomic, retain) id<TripleplayPlatformNativeTextField_Transformer> _defaultTransformer;
@property (nonatomic, retain) id<TripleplayPlatformNativeTextField_Validator> _defaultValidator;
@property (nonatomic, retain) ReactSignal *_finishedEditing;
@property (nonatomic, copy) NSString *_popupLabel;
@property (nonatomic, assign) int _maxFieldLength;

+ (TripleplayUiStyle_Flag *)FULLTIME_NATIVE_FIELD;
+ (TripleplayUiStyle_Flag *)AUTOCAPITALIZATION;
+ (TripleplayUiStyle_Flag *)AUTOCORRECTION;
+ (TripleplayUiStyle_Flag *)SECURE_TEXT_ENTRY;
+ (TripleplayUiStyle *)TEXT_TYPE;
+ (TripleplayUiStyle *)MAXIMUM_INPUT_LENGTH;
+ (TripleplayUiStyle *)RETURN_KEY_LABEL;
+ (TripleplayUiStyle_Flag *)MULTILINE;
- (id)init;
- (id)initWithNSString:(NSString *)initialText;
- (id)initWithTripleplayUiStyles:(TripleplayUiStyles *)styles;
- (id)initWithNSString:(NSString *)initialText
withTripleplayUiStyles:(TripleplayUiStyles *)styles;
- (id<ReactSignalView>)finishedEditing;
- (TripleplayUiField *)setTextTypeWithPlaynCoreKeyboard_TextTypeEnum:(PlaynCoreKeyboard_TextTypeEnum *)type;
- (TripleplayUiField *)setPopupLabelWithNSString:(NSString *)label;
- (TripleplayUiField *)setValidatorWithTripleplayPlatformNativeTextField_Validator:(id<TripleplayPlatformNativeTextField_Validator>)validator;
- (TripleplayUiField *)setTransformerWithTripleplayPlatformNativeTextField_Transformer:(id<TripleplayPlatformNativeTextField_Transformer>)transformer;
- (TripleplayUiField *)updateNativeFieldBounds;
- (BOOL)hasFocus;
- (BOOL)textIsValidWithNSString:(NSString *)text;
- (NSString *)transformTextWithNSString:(NSString *)text;
- (IOSClass *)getStyleClass;
- (NSString *)text;
- (id<TripleplayUiIcon>)icon;
- (void)onPointerStartWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event
                                       withFloat:(float)x
                                       withFloat:(float)y;
- (void)wasRemoved;
- (TripleplayUiElement_LayoutData *)createLayoutDataWithFloat:(float)hintX
                                                    withFloat:(float)hintY;
- (BOOL)fulltimeNativeField;
- (PythagorasFRectangle *)getNativeFieldBounds;
- (void)updateModeWithBOOL:(BOOL)nativeField;
- (void)setGlyphLayerAlphaWithFloat:(float)alpha;
@end

@interface TripleplayUiField_FieldLayoutData : TripleplayUiTextWidget_TextLayoutData {
 @public
  TripleplayUiField *this$3_;
}

@property (nonatomic, retain) TripleplayUiField *this$3;

- (id)initWithTripleplayUiField:(TripleplayUiField *)outer$
                      withFloat:(float)hintX
                      withFloat:(float)hintY;
- (void)layoutWithFloat:(float)left
              withFloat:(float)top
              withFloat:(float)width
              withFloat:(float)height;
@end

@interface TripleplayUiField_$1 : ReactSlot {
 @public
  TripleplayUiField *this$0_;
}

@property (nonatomic, retain) TripleplayUiField *this$0;

- (void)onEmitWithId:(JavaLangBoolean *)event;
- (id)initWithTripleplayUiField:(TripleplayUiField *)outer$;
@end

@interface TripleplayUiField_$2 : NSObject < PlaynCoreUtilCallback > {
 @public
  TripleplayUiField *this$0_;
}

@property (nonatomic, retain) TripleplayUiField *this$0;

- (void)onSuccessWithId:(NSString *)result;
- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)cause;
- (id)initWithTripleplayUiField:(TripleplayUiField *)outer$;
@end

@interface TripleplayUiField_$3 : NSObject < TripleplayPlatformNativeTextField_Transformer > {
 @public
  TripleplayUiField *this$0_;
}

@property (nonatomic, retain) TripleplayUiField *this$0;

- (NSString *)transformWithNSString:(NSString *)text;
- (id)initWithTripleplayUiField:(TripleplayUiField *)outer$;
@end

@interface TripleplayUiField_$4 : NSObject < TripleplayPlatformNativeTextField_Validator > {
 @public
  TripleplayUiField *this$0_;
}

@property (nonatomic, retain) TripleplayUiField *this$0;

- (BOOL)isValidWithNSString:(NSString *)text;
- (id)initWithTripleplayUiField:(TripleplayUiField *)outer$;
@end
