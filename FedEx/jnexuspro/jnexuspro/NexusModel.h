//
//  NexusModel.h
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

// Pages
NSString * const URL_BASE;
NSString * const LOGIN_PAGE;
NSString * const GETSARS_PAGE;


NSString * const LOST_STOLEN_METER;

/****** FIELDS *****/
//LOGIN
NSString * const EMPLOYEE_ID;
NSString * const NEXUS_PWD;
NSString * const EMPLOYEE_VANMETERNUM;
NSString * const EMPLOYEE_NAME;

// CONTACT
NSString * const ACCOUNT_NUM;
NSString * const BUSINESS_NAME;
NSString * const ADDRESS_LINE1;
NSString * const ADDRESS_LINE2;
NSString * const CITY;
NSString * const STATE;
NSString * const ZIP;
NSString * const CONTACT_NUMBER;
NSString * const CONTACT_NAME;


// TIME/TRAVEL
NSString * const DEPART_TIME;
NSString * const START_TRAVEL_TIME;
NSString * const ARRIVE_TIME;
NSString * const INTERUPT_JOB_TIME;
NSString * const RETURN_TIME;
NSString * const TRAVEL_MILES;
NSString * const INTERRUPT_TRAVEL_TIME;
NSString * const RETURN_MILES;

//SAR
NSString * const SAR_NUM;
NSString * const PROBLEM_TYPE;
NSString * const SAR_STATUS;
NSString * const CLOSE_DATE;
NSString * const RESOLUTION_DETAIL;
NSString * const PRIORITY_STATUS;
NSString * const COMPONENT_TYPE;
NSString * const SYSTEM_TYPE;
NSString * const METER_NUMBER;
NSString * const NOTES;
NSString * const COMMENTS;
NSString * const EXPIRATION_DATE;
NSString * const PROBLEM_DETAIL;


// Parts
NSString * const PART_NUMBER;
NSString * const SERIAL_NUMBER;
NSString * const DMT_NUMBER;
NSString * const AIRBILL_NUMBER;
NSString * const INVENTORY_DATE;
NSString * const PART_DESCRIPTION;
NSString * const PROBLEM_RESOLUTION_CODE;
NSString * const STATUS_CODE;
NSString * const STATUS_DETAIL;

// Order
NSString * const QUANTITY;
NSString * const ORDER_DATE;
NSString * const ORDER_NUM;
NSString * const ORDER_STATUS;
NSString * const ORDER_TRACKING_NUM;
NSString * const ORDER_SHIPPED_STATUS;

@interface NexusModel : NSObject


+ (NSMutableDictionary *) verifyLoginForID:(NSString *) employeeID Password:(NSString *) password;
+ (NSMutableDictionary *) getPartsForMeter:(NSString *) meterNum;

+ (NSMutableDictionary *) getSarsForID:(NSString *) employeeID;

+ (NSMutableDictionary *) addParts:(NSArray *) parts ForMeter:(NSString *) meterNum;
+ (NSMutableDictionary *) getPartInfoForSerial:(NSString *) serialNum;
+ (NSMutableDictionary *) saveDMT:(NSString *) dmt AndAirbill:(NSString *) air ForSerial:(NSString *) serial;

+ (NSMutableDictionary *) saveTimeTravel:(NSMutableDictionary *) info ForSar:(NSString *) sarNumber;
+ (NSMutableDictionary *) saveComment:(NSString *) comment ForSar:(NSString *) sarNum;

+ (NSMutableDictionary *) orderPartNum:(NSString *) part withQuantity:(NSString *) quantity forEmployee:(NSString *) employeeID andMeterNum:(NSString *) meterNum;

+ (NSMutableDictionary *) saveContactInfoForAccount:(NSString *) account withInfo:(NSMutableDictionary *) info;

+ (NSMutableDictionary *) transferSar:(NSString *)sarNum toTech:(NSString *)techID;
+ (NSMutableDictionary *) changeStatusForSar:(NSString *)sarNum toStatus:(NSString *)newStatus;
+ (NSMutableDictionary *) getTransferrableTechsForTech:(NSString *) employeeID;
+ (NSMutableDictionary *) closeSar:(NSString *) sarNum withDate:(NSString *) currentDate andResolution:(NSString *) resCode;
+ (NSMutableDictionary *) getResolutionCodesForProblemType:(NSString *)problemType;
+ (NSMutableDictionary *) getPartsList;
+ (NSMutableDictionary *) getStatusList;
+ (NSMutableDictionary *) getOrdersForID:(NSString *)employeeID;
+ (NSMutableDictionary *) getProblemCodeList;
+ (NSMutableDictionary *) createTicket:(NSMutableDictionary *) info ForEmployee:(NSString *) employeeID;
+ (NSMutableDictionary *) takeInventoryForMeter:(NSString *) meterNum withParts:(NSMutableArray *) parts andDate:(NSString *) currentDate;

@end
