//
//  BLAPI.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLCompany.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^ DataBlock)(NSDictionary * json, NSError *error);

@interface BLAPI : NSObject
//@property (nonatomic, copy) void (^result)(NSDictionary *json, NSError *error);
@property (nonatomic, strong) NSDictionary *res_json;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, copy) DataBlock block;
@property (nonatomic, copy) DataBlock requestBlock;


+ (BLAPI *)sharedInstance;

- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage completion:(DataBlock)completion;
- (void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;
- (NSString *)setUrlWithType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;
- (NSString *)setUrlWithEmployerId:(NSString *)ID;
- (void)requestVacansyForCompany:(BLCompany *)company completion:(DataBlock)completion;

//Получение вакансий  /Список опубликованных вакансий/
//Класс для вакансий
//requestVacansyForCompany:(BLCompany *)company completion(DataBlock)completion;
@end

NS_ASSUME_NONNULL_END
