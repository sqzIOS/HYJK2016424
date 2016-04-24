
//
//  MyCLController.m
//  AutoNavi
//
//  Created by yu.liao on 12-3-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "MyCLController.h"

static MyCLController *instance = nil;
//static int gpsFilterNum = 0;

@implementation MyCLController

- (id) init {
	self = [super init];
	if (self != nil)
    {
		locationManager = [[CLLocationManager alloc] init] ;
        locationManager.delegate = self;
        gpsOpened = NO;
	}
	return self;
}

+ (MyCLController *)sharedInstance 
{
    if (instance == nil) 
    {
        instance = [[MyCLController alloc] init];
    }
    return instance;
}

+(void)releaseInstance
{
    instance = nil;
}

-(void)startUpdateLocation
{
    if(IOS8)
    {
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }

    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
}

-(void)stopUpdateLocation
{
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
//	NSString *date = [[[NSString alloc] init] autorelease];
	//gpsInfo = {0};
    
    gpsOpened = YES;
//    memset(&gpsInfo, 0x0, sizeof(GPSINFO));
//	gpsInfo.longitude = newLocation.coordinate.longitude;// 经度
//	gpsInfo.latitude = newLocation.coordinate.latitude;// 纬度
    
    NSLog(@"newLocation= %@",newLocation);
    
    self.longitudeStr = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    self.latitudeStr = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
    
    
    [self stopUpdateLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
    if ((![manager locationServicesEnabled]) || error.code == kCLErrorDenied) 
    {
        NSLog(@"GPS刷新位置失败");
    }
}

-(GPSINFO *)getGpsInfo
{
    if (gpsOpened)
        return &gpsInfo;
    else
        return NULL;
}

-(void)dealloc
{
    locationManager = nil;
}

@end