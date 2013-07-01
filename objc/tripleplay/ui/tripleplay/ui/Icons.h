//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/Icons.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangThrowable;
@protocol PlaynCoreImage;
@protocol PlaynCoreLayer;

#import "JreEmulation.h"
#import "playn/core/util/Callback.h"
#import "tripleplay/ui/Icon.h"

@interface TripleplayUiIcons : NSObject {
}

+ (id<TripleplayUiIcon>)imageWithPlaynCoreImage:(id<PlaynCoreImage>)image;
- (id)init;
@end

@interface TripleplayUiIcons_$1 : NSObject < TripleplayUiIcon > {
 @public
  id<PlaynCoreImage> val$image_;
}

@property (nonatomic, retain) id<PlaynCoreImage> val$image;

- (float)width;
- (float)height;
- (id<PlaynCoreLayer>)render;
- (void)addCallbackWithPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)callback;
- (id)initWithPlaynCoreImage:(id<PlaynCoreImage>)capture$0;
@end

@interface TripleplayUiIcons_$1_$1 : NSObject < PlaynCoreUtilCallback > {
 @public
  id<PlaynCoreUtilCallback> val$callback_;
  id<TripleplayUiIcon> val$icon_;
}

@property (nonatomic, retain) id<PlaynCoreUtilCallback> val$callback;
@property (nonatomic, retain) id<TripleplayUiIcon> val$icon;

- (void)onSuccessWithId:(id<PlaynCoreImage>)result;
- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)cause;
- (id)initWithPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)capture$0
               withTripleplayUiIcon:(id<TripleplayUiIcon>)capture$1;
@end
