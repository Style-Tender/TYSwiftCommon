#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+TYArray.h"
#import "NSDictionary+TYDictionary.h"

FOUNDATION_EXPORT double TYSwiftCommonVersionNumber;
FOUNDATION_EXPORT const unsigned char TYSwiftCommonVersionString[];

