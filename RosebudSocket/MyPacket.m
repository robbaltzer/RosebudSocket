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

#import "MyPacket.h"
#import "AppDelegate.h"
#import <zlib.h>

/*
@interface NSData (CRC32)
- (uint32_t)CRC32Value;
@end


@implementation NSData (CRC32)
- (uint32_t)CRC32Value {
    u32 crc = crc32(0L, Z_NULL, 0);
    crc = crc32(crc, [self bytes], [self length]);
    return crc;
}
@end
*/

@implementation MyPacket
@synthesize theData;

- (id)init
{
    RosebudPacket packet;
    
    self = [super init];
    if (self) {
        trace = ApplicationDelegate.trace;
        // Initialization code here
        memset((void*) &packet, 0, sizeof(RosebudPacket));
        packet.startByte = START_BYTE;
//        packet.packet_len = PACKET_HEADER_LEN;
//        packet.packet_total = 1;
//        packet.packet_number = 1;
//        theData = [[NSMutableData alloc] initWithBytes:&packet length:PACKET_HEADER_LEN];
    }
    return self;
}

- (id) initWithNSData: (NSData*) initData {
    RosebudPacket* packet;
    
    self = [super init];
    if (self) {
        // Initialization code here
        theData = [[NSMutableData alloc] initWithBytes:[initData bytes] length:[initData length]];
        packet = (RosebudPacket*) [theData bytes];
        if (packet->startByte != START_BYTE) {
            //[myTraceController trace:@"(err) Bad start byte"]; todo: error message
            return 0;
        }
        
    }
    return self;
}

// todo: probably can get rid of this...
- (void) updateWithNSData: (NSData*) updateData {
    [theData setLength:0];
    [theData appendData:updateData];
}

- (void) updateWithNSMutableData: (NSMutableData*) updateData {
    [theData setLength:0];
    [theData appendData:updateData];
}

- (void) createSimplePacket: (u8) parameter : (u8) cmd : (s16) value {
    RosebudPacket* packet;

    packet = (RosebudPacket*) [theData mutableBytes];
    packet->parameter = parameter;
    packet->command = cmd;   
    packet->value = value;   
}

- (void) createDataPacket: (u8) parameter : (u8) cmd : (s16) value : (u16) len :(u8*) data {
    RosebudPacket* packet;
    
    packet = (RosebudPacket*) [theData mutableBytes];
    packet->parameter = parameter;
    packet->command = cmd;   
    packet->value = value;
    packet->packetLen += len;
//    [trace trace:FORMAT(@"packet->packet_len %d", packet->packet_len)];
    [theData appendBytes:data length:len];
}

@end



