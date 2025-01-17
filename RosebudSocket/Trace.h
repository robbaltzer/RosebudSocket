/*
 * Copyright 2013 by Rob Baltzer
 *
 *
 * All Rights Reserved
 *
 *
 * This file may not be modified, copied, or distributed in part or in whole
 * without prior written consent from Rob Baltzer.
 *
 *
 * ROB BALTZER DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
 * ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL
 * ROB BALTZER BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
 * ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
 * WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
 * ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
 * SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import "Types.h"

#define FORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

@interface Trace : NSObject {
    NSMutableString *textViewText;
    BOOL dataCollectionMode;
}

@property BOOL dataCollectionMode;
@property (nonatomic, strong) UITextView *textView;

- (void) trace: (NSString*) theString;
- (void) traceData: (NSString*) theFormat : (uint32_t) theTime : (uint32_t) theValue;
- (void) traceString: (NSString*) theFormat : (NSString*) theString;
- (void) traceBulkData: (int) count : (u8*) bytes;
- (void) clear;
- (void) update;

@end
