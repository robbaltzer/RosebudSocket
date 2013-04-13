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
#import "MyPacket.h"

@class EASessionController;

@interface SendPacket : NSObject {
//    EASessionController *_eaSessionController;
}

//@property (nonatomic, strong) EASessionController *_eaSessionController;

- (void) sendSimplePacket: (u8) parameter : (u8) cmd : (s16) value;
- (void)sendDataPacket: (u8) parameter : (u8) cmd : (s16) value : (u16) len : (u8*) data;
@end
