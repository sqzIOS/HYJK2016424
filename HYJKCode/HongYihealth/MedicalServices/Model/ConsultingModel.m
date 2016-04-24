//
//  ConsultingModel.m
//  
//
//  Created by 刘朝涛 on 16/1/1.
//
//  功能: 医师数据模型

#import "ConsultingModel.h"

@implementation ConsultingModel

- (instancetype)initWithDic:(NSDictionary *)dict {
    if (self = [self init]) {
        
        id value = nil;
        
        value = dict[@"doctoeHead"];
        if (value)
            _doctoeHead = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"doctorName"];
        if (value)
            _doctorName = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"doctorDeparment"];
        if (value)
            _doctorDeparment = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"doctorJobName"];
        if (value)
            _doctorJobName = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"doctor_hospital"];
        if (value)
            _doctor_hospital = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"doctorIntroduce"];
        if (value)
            _doctorIntroduce = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"content"];
        if (value)
            _content = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"address"];
        if (value)
            _address = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"job2Str"];
        if (value)
            _job2Str = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"starNum"];
        if (value)
            _starNum = [NSString stringWithFormat:@"%@",value];
        
        value = dict[@"isAbout"];
        if (value)
            _isAbout = [NSString stringWithFormat:@"%@",value];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.doctoeHead forKey:@"doctoeHead"];
    [aCoder encodeObject:self.doctorName forKey:@"doctorName"];
    [aCoder encodeObject:self.doctorJobName forKey:@"doctorJobName"];
    [aCoder encodeObject:self.job2Str forKey:@"job2Str"];
    [aCoder encodeObject:self.doctor_hospital forKey:@"doctor_hospital"];
    [aCoder encodeObject:self.doctorDeparment forKey:@"doctorDeparment"];
    [aCoder encodeObject:self.doctorIntroduce forKey:@"doctorIntroduce"];
    [aCoder encodeObject:self.starNum forKey:@"starNum"];
    [aCoder encodeObject:self.isAbout forKey:@"isAbout"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.content forKey:@"content"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.doctoeHead = [aDecoder decodeObjectForKey:@"doctoeHead"];
        self.doctorName = [aDecoder decodeObjectForKey:@"doctorName"];
        self.doctorJobName = [aDecoder decodeObjectForKey:@"doctorJobName"];
        self.job2Str = [aDecoder decodeObjectForKey:@"job2Str"];
        self.doctor_hospital = [aDecoder decodeObjectForKey:@"doctor_hospital"];
        self.doctorDeparment = [aDecoder decodeObjectForKey:@"doctorDeparment"];
        self.doctorIntroduce = [aDecoder decodeObjectForKey:@"doctorIntroduce"];
        self.starNum = [aDecoder decodeObjectForKey:@"starNum"];
        self.isAbout = [aDecoder decodeObjectForKey:@"isAbout"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
    }
    return self;
}

@end
