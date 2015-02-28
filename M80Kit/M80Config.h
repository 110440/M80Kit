//
//  M80Config.h
//  M80Kit
//
//  Created by amao on 2/28/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#ifndef M80Kit_M80Config_h
#define M80Kit_M80Config_h

#define M80_DEBUG_LOG       1

#if  M80_DEBUG_LOG
#define M80Log  NSLog
#else
#define M80Log(...)
#endif
#endif
