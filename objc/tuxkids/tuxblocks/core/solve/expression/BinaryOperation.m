//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\expression\BinaryOperation.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSObjectArray.h"
#import "tuxkids/tuxblocks/core/solve/expression/BinaryOperation.h"
#import "tuxkids/tuxblocks/core/solve/expression/Expression.h"
#import "tuxkids/tuxblocks/core/solve/expression/NonevaluatableException.h"
#import "tuxkids/tuxblocks/core/solve/expression/Number.h"
#import "tuxkids/tuxblocks/core/utils/Formatter.h"
#import "tuxkids/tuxblocks/core/utils/HashCode.h"

@implementation TBBinaryOperation

- (TBExpression *)operandA {
  return operandA_;
}
- (void)setOperandA:(TBExpression *)operandA {
  JreOperatorRetainedAssign(&operandA_, self, operandA);
}
@synthesize operandA = operandA_;
- (TBExpression *)operandB {
  return operandB_;
}
- (void)setOperandB:(TBExpression *)operandB {
  JreOperatorRetainedAssign(&operandB_, self, operandB);
}
@synthesize operandB = operandB_;

- (TBExpression *)getOperandA {
  return operandA_;
}

- (TBExpression *)getOperandB {
  return operandB_;
}

- (id)initWithTBExpression:(TBExpression *)operandA
          withTBExpression:(TBExpression *)operandB {
  if ((self = [super init])) {
    self.operandA = operandA;
    self.operandB = operandB;
  }
  return self;
}

- (NSString *)toMathString {
  NSString *aString = [((TBExpression *) NIL_CHK(operandA_)) toMathString];
  if ([((TBExpression *) NIL_CHK(operandA_)) getPrecedence] < [self getPrecedence]) {
    aString = [NSString stringWithFormat:@"(%@)", aString];
  }
  NSString *bString = [((TBExpression *) NIL_CHK(operandB_)) toMathString];
  if ([((TBExpression *) NIL_CHK(operandB_)) getPrecedence] < [self getPrecedence]) {
    bString = [NSString stringWithFormat:@"(%@)", bString];
  }
  return [TBFormatter formatWithNSString:@"%s %s %s" withNSObjectArray:[IOSObjectArray arrayWithType:[IOSClass classWithClass:[NSObject class]] count:3, aString, [self getSymbol], bString ]];
}

- (BOOL)hasVariable {
  return [((TBExpression *) NIL_CHK(operandA_)) hasVariable] || [((TBExpression *) NIL_CHK(operandB_)) hasVariable];
}

- (int)evaluate {
  return [self operateWithInt:[((TBExpression *) NIL_CHK(operandA_)) evaluate] withInt:[((TBExpression *) NIL_CHK(operandB_)) evaluate]];
}

- (TBExpression *)getSimplified {
  JreOperatorRetainedAssign(&operandA_, self, [((TBExpression *) NIL_CHK(operandA_)) getSimplified]);
  JreOperatorRetainedAssign(&operandB_, self, [((TBExpression *) NIL_CHK(operandB_)) getSimplified]);
  @try {
    return [[[TBNumber alloc] initWithInt:[self evaluate]] autorelease];
  }
  @catch (TBNonevaluatableException *e) {
    return self;
  }
}

- (NSString *)getSymbol {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (int)operateWithInt:(int)a
              withInt:(int)b {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (BOOL)isCommutative {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (void)addFieldsWithTBHashCode:(TBHashCode *)hashCode {
  [((TBHashCode *) NIL_CHK(hashCode)) addFieldWithId:operandA_];
  [((TBHashCode *) NIL_CHK(hashCode)) addFieldWithId:operandB_];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&operandB_, self, nil);
  JreOperatorRetainedAssign(&operandA_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBBinaryOperation *typedCopy = (TBBinaryOperation *) copy;
  typedCopy.operandA = operandA_;
  typedCopy.operandB = operandB_;
}

@end
