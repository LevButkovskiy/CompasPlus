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
        /*
        NSDictionary *snippet = [dictionary objectForKey:@"snippet"];
            self.snippetRequirement = [snippet objectForKey:@"requirement"]; //Опыт работы
            self.snippetResponsibillity = [snippet objectForKey:@"responsibillity"]; //Задачи работника
        
        NSDictionary *adress = [dictionary objectForKey:@"adress"]; //Адрес компании
            self.street = [adress objectForKey:@"street"];
            self.city = [adress objectForKey:@"city"];
            self.building = [adress objectForKey:@"building"];
            self.summuryAdress = [adress objectForKey:@"raw"];
            self.metro = [adress objectForKey:@"metro"];
        
        NSDictionary *contacts = [dictionary objectForKey:@"contacts"]; //Контакты
            self.contactName = [contacts objectForKey:@"name"];
            self.contactEmail = [contacts objectForKey:@"email"];
            NSDictionary *phones = [contacts objectForKey:@"phones"];
                NSDictionary *firstPhone = [phones objectForKey: 0];
                    NSString *phoneCountry = [firstPhone objectForKey:@"country"];
                    NSString *phoneCity = [firstPhone objectForKey:@"city"];
                    NSString *phoneNumber = [firstPhone objectForKey:@"number"];
                    self.contactPhone = [NSString stringWithFormat:@"%@%@%@", phoneCountry, phoneCity, phoneNumber];
            
        //snipped dictionary -> requirement - Опыт работы, responsibillity - Задачи работника ((strings)
        //adress - street, city, building, raw(полностью streen, city, building), metro_stations (dictionary), description, lat, lng, metro
        //contacts -> name, email, phones (dictionary)
            //phones-> country+ city + number
        */
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
