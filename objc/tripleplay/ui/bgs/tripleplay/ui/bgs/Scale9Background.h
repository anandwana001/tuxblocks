//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/bgs/Scale9Background.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSFloatArray;
@class TripleplayUiBackground_Instance;
@class TripleplayUiBgsScale9Background_Axis3;
@protocol PlaynCoreImage;
@protocol PlaynCoreSurface;
@protocol PythagorasFIDimension;

#import "JreEmulation.h"
#import "playn/core/ImmediateLayer.h"
#import "tripleplay/ui/Background.h"

@interface TripleplayUiBgsScale9Background : TripleplayUiBackground {
 @public
  TripleplayUiBgsScale9Background_Axis3 *xaxis_, *yaxis_;
  id<PlaynCoreImage> _image_;
}

@property (nonatomic, retain) TripleplayUiBgsScale9Background_Axis3 *xaxis;
@property (nonatomic, retain) TripleplayUiBgsScale9Background_Axis3 *yaxis;
@property (nonatomic, retain) id<PlaynCoreImage> _image;

- (id)initWithPlaynCoreImage:(id<PlaynCoreImage>)image;
- (TripleplayUiBackground_Instance *)instantiateWithPythagorasFIDimension:(id<PythagorasFIDimension>)size;
@end

@interface TripleplayUiBgsScale9Background_Axis3 : NSObject {
 @public
  IOSFloatArray *_offsets_;
  IOSFloatArray *_lengths_;
}

@property (nonatomic, retain) IOSFloatArray *_offsets;
@property (nonatomic, retain) IOSFloatArray *_lengths;

- (id)initWithFloat:(float)length;
- (id)initWithFloat:(float)length
withTripleplayUiBgsScale9Background_Axis3:(TripleplayUiBgsScale9Background_Axis3 *)src;
- (float)coordWithInt:(int)idx;
- (float)sizeWithInt:(int)idx;
- (TripleplayUiBgsScale9Background_Axis3 *)setWithInt:(int)idx
                                            withFloat:(float)coord
                                            withFloat:(float)size;
- (TripleplayUiBgsScale9Background_Axis3 *)resizeWithInt:(int)idx
                                               withFloat:(float)size;
@end

@interface TripleplayUiBgsScale9Background_$1 : NSObject < PlaynCoreImmediateLayer_Renderer > {
 @public
  TripleplayUiBgsScale9Background *this$0_;
  TripleplayUiBgsScale9Background_Axis3 *dx_, *dy_;
  id<PythagorasFIDimension> val$size_;
}

@property (nonatomic, retain) TripleplayUiBgsScale9Background *this$0;
@property (nonatomic, retain) TripleplayUiBgsScale9Background_Axis3 *dx;
@property (nonatomic, retain) TripleplayUiBgsScale9Background_Axis3 *dy;
@property (nonatomic, retain) id<PythagorasFIDimension> val$size;

- (void)renderWithPlaynCoreSurface:(id<PlaynCoreSurface>)surf;
- (void)drawPartWithPlaynCoreSurface:(id<PlaynCoreSurface>)surf
                             withInt:(int)x
                             withInt:(int)y;
- (id)initWithTripleplayUiBgsScale9Background:(TripleplayUiBgsScale9Background *)outer$
                    withPythagorasFIDimension:(id<PythagorasFIDimension>)capture$0;
@end
