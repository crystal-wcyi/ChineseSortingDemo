//
//  main.m
//  ChineseSortingDemo
//
//  Created by crystal on 16/4/1.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ChineseString.h"
#import "pinyin.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //step1:初始化
        NSArray *stringToSort = [NSArray arrayWithObjects:@"电脑", @"显示器", @"你好", @"推特", @"乔布斯", @"再见", @"暑假作业", @"键盘", @"鼠标", @"谷歌", @"苹果", nil];
        //step1:输出
        NSLog(@"尚未排序的NSString数组：");
        for (int i = 0; i < stringToSort.count; i ++)
        {
            NSLog(@"%@", [stringToSort objectAtIndex:i]);
        }
        
        //step2：获取字符串中文字的拼音首字母并与字符串共同存放
        NSMutableArray *chineseStringsArray = [NSMutableArray array];
        for (int i = 0; i < stringToSort.count; i ++)
        {
            ChineseString *chineseString = [[ChineseString alloc] init];
            chineseString.string = [NSString stringWithString:stringToSort[i]];
            if (chineseString.string == nil)
            {
                chineseString.string = @"";
            }
            if (![chineseString.string isEqualToString:@""])
            {
                NSString *pinYinResult = [NSString string];
                for (int j = 0; j < chineseString.string.length; j ++)
                {
                    NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c", pinyinFirstLetter([chineseString.string characterAtIndex:j])] uppercaseString];
                    pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
                }
                chineseString.pinYin = pinYinResult;
            }
            else
            {
                chineseString.pinYin = @"";
            }
            [chineseStringsArray addObject:chineseString];
        }
        
        //step2输出
        NSLog(@"\n\n\n转换为拼音首字母后的NSString数组");
        for (int i = 0; i < chineseStringsArray.count; i ++)
        {
            ChineseString *chineseString = [chineseStringsArray objectAtIndex:i];
            NSLog(@"原sting：%@---拼音首字母string：%@", chineseString.string, chineseString.pinYin);
        }
        
        //step3：按照首字母对这些Strings进行排序
        NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin" ascending:YES]];
        [chineseStringsArray sortUsingDescriptors:sortDescriptors];
        
        //step3输出
        NSLog(@"\n\n\n按照拼音首字母后的NSString数组");
        for (int i = 0; i < chineseStringsArray.count; i ++)
        {
            ChineseString *chineseString = chineseStringsArray[i];
            NSLog(@"原string：%@----拼音首字母String：%@", chineseString.string, chineseString.pinYin);
        }
        
        //step4:如果有需要，再把排序好的内容从ChineseString类中提取出来
        NSMutableArray *result = [NSMutableArray array];
        for (int i = 0; i < chineseStringsArray.count; i ++)
        {
            [result addObject:[(ChineseString *)[chineseStringsArray objectAtIndex:i] string]];
        }
        
        //step4输出
        NSLog(@"\n\n\n最终结果：");
        for (int i = 0; i < result.count; i ++)
        {
            NSLog(@"%@", result[i]);
        }
        
        //程序结束
        NSLog(@"\n\nDemo By ");
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
