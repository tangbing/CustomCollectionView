//
//  Tool.m
//  TbSettingProject
//
//  Created by Tb on 2021/5/1.
//

#import "Tool.h"

@implementation Tool

+ (NSArray *)readFileWithFileName:(NSString *)fileName {
    
    NSString *filePath =  [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&error];
    if (!error) {
        return array;
    }
    return nil;
}
@end
