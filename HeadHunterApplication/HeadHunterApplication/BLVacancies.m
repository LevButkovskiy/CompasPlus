//
//  BLVacancies.m
//  HeadHunterApplication
//
//  Created by Lev Butkovskiy on 30/11/2018.
//  Copyright © 2018 Lev Butkovskiy. All rights reserved.
//Users/butkovskiylev/Documents/GitHub/CompasPlus/HeadHunterApplication/HeadHunterApplication/BLAPI.h//

#import "BLVacancies.h"

@implementation BLVacancies

- (id)initWithDictionary:(NSDictionary *)dictionary{
    
    if(self = [super init]){
        self.name = [dictionary objectForKey:@"name"];
        self.url = [dictionary objectForKey:@"url"];
        self.ID = [dictionary objectForKey:@"id"];
        self.archived = [dictionary objectForKey:@"archived"];
        
        //Date
        NSString * tmpDate = [dictionary objectForKey:@"published_at"];
            NSDateFormatter *dateFormatterTmp = [[NSDateFormatter alloc] init];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatterTmp setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss+SSSS"];
            NSDate *dateFromString = [dateFormatterTmp dateFromString:tmpDate];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            self.dateOfPublishing = [dateFormatter stringFromDate:dateFromString];
        
        NSDictionary *snippet = [dictionary objectForKey:@"snippet"];
            self.snippetRequirement = [snippet objectForKey:@"requirement"]; //Опыт работы
            if([_snippetRequirement isKindOfClass:[NSNull class]])
                _snippetRequirement = @"Опыт работы не указан";
            self.snippetResponsibillity = [snippet objectForKey:@"responsibility"]; //Обязаности работника
                if(_snippetResponsibillity == nil)
                    _snippetResponsibillity = @"Обязаности не указаны";
        //Адрес
        NSDictionary *address = [dictionary objectForKey:@"address"];
        if([address isKindOfClass:[NSNull class]]){
            self.summuryAdress = @"Адрес компании не указан";
        }
        else{
            self.street = [address objectForKey:@"street"];
            self.city = [address objectForKey:@"city"];
            self.building = [address objectForKey:@"building"];
            self.summuryAdress = [address objectForKey:@"raw"];
            if([self.summuryAdress isKindOfClass:[NSNull class]])
                self.summuryAdress = [NSString stringWithFormat:@"%@, %@ %@", _city, _street, _building];
            else if ([self.summuryAdress isKindOfClass:[NSNull class]])
                self.summuryAdress = @"Адрес компании не указан";
           // self.metro = [address objectForKey:@"metro"];
        }
        
       //Контакты
        NSDictionary *contacts = [dictionary objectForKey:@"contacts"];
        if([[dictionary objectForKey:@"contacts"] isKindOfClass:[NSNull class]]){
            _contactName = @"Имя не указано";
            _contactEmail = @"Email не указан";
            _contactPhone = @"Телефон не указан";
        }
        else{
            self.contactName = [contacts objectForKey:@"name"];
            if([_contactName isKindOfClass:[NSNull class]]) _contactName = @"Имя не указано";
            self.contactEmail = [contacts objectForKey:@"email"];
            if([_contactEmail isKindOfClass:[NSNull class]]) _contactEmail = @"Email не указан";
            NSDictionary *phones = [contacts objectForKey:@"phones"];
            NSDictionary *firstPhone = [[phones objectEnumerator]nextObject];
                self.firstElPhone = [firstPhone objectForKey:@"country"];
                self.secondElPhone = [firstPhone objectForKey:@"city"];
                self.thirdElPhone = [firstPhone objectForKey:@"number"];
                self.contactPhone = [NSString stringWithFormat:@"+%@(%@)%@", _firstElPhone, _secondElPhone, _thirdElPhone];
                if([_contactPhone isKindOfClass:[NSNull class]]){
                    _contactPhone = @"Телефон не указан";
                }
        }
        
        //Зарплата
        NSDictionary *salary = [dictionary objectForKey:@"salary"];
        if([salary isKindOfClass:[NSNull class]]){
            NSLog(@"ERROR: salary is null");
        }
        else{
            if([[salary objectForKey:@"to"] isKindOfClass:[NSNull class]])
                NSLog(@"ERROR: salary To is null");
            else self.salaryTo = [[salary objectForKey:@"to"]longValue];
            if([[salary objectForKey:@"from"] isKindOfClass:[NSNull class]])
            NSLog(@"ERROR: salary From is null");
            else self.salaryFrom = [[salary objectForKey:@"from"]longValue];
            if([[salary objectForKey:@"currency"] isKindOfClass:[NSNull class]])
                NSLog(@"ERROR: salary Currency is null");
            else self.salaryCurrency = [salary objectForKey:@"currency"];
        }
    }
    return self;
}

@end
