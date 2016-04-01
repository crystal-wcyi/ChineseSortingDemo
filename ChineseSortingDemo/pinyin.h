//
//  pinyin.h
//  ChineseSortingDemo
//
//  Created by crystal on 16/4/1.
//  Copyright © 2016年 crystal. All rights reserved.
//

#ifndef pinyin_h
#define pinyin_h

#include <stdio.h>

#endif /* pinyin_h */
/*
 * // Example
 *
 * #import "pinyin.h"
 *
 * NSString *hanyu = @"中文测试文字！";
 * for (int i = 0; i < [hanyu length]; i++)
 * {
 *     printf("%c", pinyinFirstLetter([hanyu characterAtIndex:i]));
 * }
 *
 */
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZ#"
char pinyinFirstLetter(unsigned short hanzi);