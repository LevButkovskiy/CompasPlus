//
//  BLVacancies.h
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 30/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLVacancies : NSObject

//Основная информация
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *dateOfPublishing;
@property (nonatomic, strong) NSString *archived;

//Salary
@property (nonatomic, assign) long salaryFrom;
@property (nonatomic, assign) long salaryTo;
@property (nonatomic, strong) NSString *salaryCurrency;

//Snippet
@property (nonatomic, strong) NSString *snippetRequirement;
@property (nonatomic, strong) NSString *snippetResponsibillity;

//Adress
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *building;
@property (nonatomic, strong) NSString *summuryAdress;
@property (nonatomic, strong) NSString *metro;

//Contacts
@property (nonatomic, strong) NSString *contactName;
@property (nonatomic, strong) NSString *contactEmail;
@property (nonatomic, strong) NSString *contactPhone;
@property (nonatomic, strong) NSString *firstElPhone;
@property (nonatomic, strong) NSString *secondElPhone;
@property (nonatomic, strong) NSString *thirdElPhone;

@property(nonatomic, assign) BOOL liked;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
