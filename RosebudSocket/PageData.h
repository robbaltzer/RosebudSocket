//
//  PageData.h
//  Rosebud
//
//  Created by Rob Baltzer on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Types.h"

// Object class for storing PAYLOAD_SIZE bytes of data
@interface PageData : NSObject {
    u8 data[PAYLOAD_SIZE];
    int len;
}
@property u8* bytes;
@property int len;
@end

