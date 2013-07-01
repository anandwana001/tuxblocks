//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\expression\Subtraction.java
//
//  Created by Thomas on 7/1/13.
//

#import "tuxkids/tuxblocks/core/solve/expression/Expression.h"
#import "tuxkids/tuxblocks/core/solve/expression/Subtraction.h"

@implementation TBSubtraction

- (id)initWithTBExpression:(TBExpression *)operandA
          withTBExpression:(TBExpression *)operandB {
  return [super initWithTBExpression:operandA withTBExpression:operandB];
}

- (int)operateWithInt:(int)a
              withInt:(int)b {
  return a - b;
}

- (NSString *)getSymbol {
  return @"-";
}

- (BOOL)isCommutative {
  return NO;
}

- (int)getPrecedence {
  return TBExpression_PREC_ADD;
}

- (void)dealloc {
  [super dealloc];
}

@end
