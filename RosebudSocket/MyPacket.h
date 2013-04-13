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
#import "Trace.h"

@interface MyPacket : NSObject {
    NSMutableData* theData;
    Trace* trace;
}

@property (nonatomic, strong) NSMutableData* theData;

- (id) initWithNSData: (NSData*) initData;      // Use this if not already alloc'd
- (void) updateWithNSData: (NSData*) updateData;  // Use this if already created with init
- (void) updateWithNSMutableData: (NSMutableData*) updateData;  // Use this if already created with init
- (void) createSimplePacket: (u8) parameter : (u8) cmd : (s16) value;
- (void) createDataPacket: (u8) parameter : (u8) cmd : (s16) value : (u16) len :(u8*) data;
@end
