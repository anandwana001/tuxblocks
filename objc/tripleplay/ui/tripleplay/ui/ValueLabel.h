//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/ValueLabel.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@protocol ReactValueView;
@protocol TripleplayUiIcon;

#import "JreEmulation.h"
#import "tripleplay/ui/TextWidget.h"

@interface TripleplayUiValueLabel : TripleplayUiTextWidget {
 @public
  id<ReactValueView> text__;
}

@property (nonatomic, retain) id<ReactValueView> text_;

- (id)initWithReactValueView:(id<ReactValueView>)text;
- (NSString *)description;
- (IOSClass *)getStyleClass;
- (NSString *)text;
- (id<TripleplayUiIcon>)icon;
@end
