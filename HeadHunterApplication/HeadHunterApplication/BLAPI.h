//
//  BLAPI.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 06/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLCompany.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void (^ DataBlock)(NSDictionary * json, NSError *error);
typedef void (^ ImageBlock)(UIImage * image, NSError *error);

@interface BLAPI : NSObject
//@property (nonatomic, copy) void (^result)(NSDictionary *json, NSError *error);
@property (nonatomic, strong) NSDictionary *res_json;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, copy) DataBlock block;
@property (nonatomic, copy) DataBlock requestBlock;



+(BLAPI *)sharedInstance;

-(void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage completion:(DataBlock)completion;
-(void)requestDataForType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;
-(NSString *)setUrlWithType:(NSString *)type onPage:(NSNumber *)page perPage:(NSNumber *)perPage;
-(NSString *)setUrlWithEmployerId:(NSString *)ID;
-(void)requestVacansyForCompany:(BLCompany *)company completion:(DataBlock)completion;
-(void)imageWithURL:(NSString *)url completion:(ImageBlock)completion;
@end

NS_ASSUME_NONNULL_END
