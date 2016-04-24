//
//  MyCLController.h
//  AutoNavi
//
//  Created by yu.liao on 12-3-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import <CoreLocation/CoreLocation.h>

typedef struct _GPSINFO
{
    float longitude;
    float latitude;
}GPSINFO;

@interface MyCLController : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
    GPSINFO gpsInfo;
    BOOL gpsOpened;
}

@property(strong,nonatomic)NSString *longitudeStr;
@property(strong,nonatomic)NSString *latitudeStr;

+ (MyCLController *)sharedInstance;
+(void)releaseInstance;
-(void)startUpdateLocation;
-(void)stopUpdateLocation;

-(GPSINFO *)getGpsInfo;

@end

