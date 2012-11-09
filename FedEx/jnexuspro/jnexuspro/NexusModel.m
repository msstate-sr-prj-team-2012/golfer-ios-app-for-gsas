//
//  NexusModel.m
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NexusModel.h"
#import "AppDelegate.h"

NSString * const URL_BASE = @"http://chadgalloway.net/fedex/";
NSString * const LOGIN_PAGE = @"login.php";
NSString * const GETSARS_PAGE = @"get_sars.php";
NSString * const GETPARTS_PAGE = @"get_parts.php";
NSString * const ADDPARTS_PAGE = @"add_part.php";
NSString * const PARTINFO_PAGE = @"part_info.php";
NSString * const DMTAIR_PAGE = @"dmt_airbill.php";
NSString * const TIMETRAVEL_PAGE = @"update_time_travel.php";
NSString * const COMMENTS_PAGE = @"add_comment.php";
NSString * const ORDERPARTS_PAGE = @"orderparts.php";
NSString * const UPDATECONTACT_PAGE = @"update_customer_info.php";
NSString * const TRANSFERTICKET_PAGE = @"transfer_ticket.php";
NSString * const CHANGESTATUS_PAGE = @"change_sar_status.php";
NSString * const GETTRANSFERTECHS_PAGE = @"get_transfer_list.php";
NSString * const CLOSETICKET_PAGE = @"close_ticket.php";
NSString * const GETRESOLUTIONCODES_PAGE = @"get_resolution_codes.php";
NSString * const GETPARTSLIST_PAGE = @"get_parts_list.php";
NSString * const GETSTATUSLIST_PAGE = @"get_status_list.php";
NSString * const GETORDERS_PAGE = @"view_orders.php";
NSString * const GETPROBLEMCODELIST_PAGE = @"get_problem_codes.php";
NSString * const CREATETICKET_PAGE = @"create_ticket.php";
NSString * const TAKEINVENTORY_PAGE = @"update_inventory.php";



/****** FIELDS *****/
//LOGIN
NSString * const EMPLOYEE_ID = @"Tech_ID";
NSString * const NEXUS_PWD = @"Password";
NSString * const EMPLOYEE_VANMETERNUM = @"Van_Meter_Number";
NSString * const EMPLOYEE_NAME = @"Name";

// CONTACT
NSString * const ACCOUNT_NUM = @"Account_Number";
NSString * const BUSINESS_NAME = @"Business_Name";
NSString * const ADDRESS_LINE1 = @"Address_Line1";
NSString * const ADDRESS_LINE2 = @"Address_Line2";
NSString * const CITY = @"City";
NSString * const STATE = @"State";
NSString * const ZIP = @"Zip";
NSString * const CONTACT_NUMBER = @"Contact_Number";
NSString * const CONTACT_NAME = @"Contact_Name";

NSString * const LOST_STOLEN_METER = @"LOST_STOLEN";



// TIME/TRAVEL
NSString * const DEPART_TIME = @"Depart_Time";
NSString * const START_TRAVEL_TIME = @"Start_Travel";
NSString * const ARRIVE_TIME = @"Arrival_Time";
NSString * const INTERUPT_JOB_TIME = @"Interrupt_Time";
NSString * const RETURN_TIME = @"Return_Time";
NSString * const TRAVEL_MILES = @"Travel_Miles";
NSString * const INTERRUPT_TRAVEL_TIME = @"Interrupt_Travel_Time";
NSString * const RETURN_MILES = @"Return_Miles";

//SAR
NSString * const SAR_NUM = @"Sar_Number";
NSString * const PROBLEM_TYPE = @"Problem_Type";
NSString * const SYSTEM_TYPE = @"System_Type";
NSString * const SAR_STATUS = @"Sar_Status";
NSString * const CLOSE_DATE = @"Close_Date";
NSString * const RESOLUTION_DETAIL = @"Resolution_Detail";
NSString * const RESOLUTION_CODE = @"Resolution_Code";
NSString * const PRIORITY_STATUS = @"Priority_Status";
NSString * const COMPONENT_TYPE = @"Component_Type";
NSString * const METER_NUMBER = @"Meter_Number";
NSString * const NOTES = @"Notes";
NSString * const COMMENTS = @"Comment";
NSString * const EXPIRATION_DATE = @"Expiration";
NSString * const PROBLEM_DETAIL = @"Problem_Detail";

// Parts
NSString * const PART_NUMBER = @"Part_Number";
NSString * const SERIAL_NUMBER = @"Serial_Number";
NSString * const DMT_NUMBER = @"DMT_Number";
NSString * const AIRBILL_NUMBER = @"Airbill_Number";
NSString * const INVENTORY_DATE = @"Inventory_Date";
NSString * const PART_DESCRIPTION = @"Description";


NSString * const STATUS_CODE = @"Status_Code";
NSString * const STATUS_DETAIL = @"Status_Detail";

//Order Part
NSString * const QUANTITY = @"Quantity_Ordered";
NSString * const ORDER_DATE = @"Date_Ordered";
NSString * const ORDER_NUM = @"Order_Number";
NSString * const ORDER_STATUS = @"Status";
NSString * const ORDER_TRACKING_NUM = @"Tracking_Number";
NSString * const ORDER_SHIPPED_STATUS = @"SHIPPED";

NSString * const PARTSARRAY = @"Parts[]";
NSString * const DMTAIRBILLARRAY = @"dmt_air";
NSString * const TIMETRAVELARRAY = @"time_travel";
NSString * const COMMENTARRAY = @"comment";
NSString * const ORDERPARTSARRAY = @"order";
NSString * const UPDATECONTACTARRAY = @"associative_array";
NSString * const TRANSFERTICKETARRAY = @"Transfer";
NSString * const TRANSFER_TECH_ID = @"New_Tech_ID";
NSString * const CHANGESTATUSARRAY = @"Status_Change";
NSString * const CHANGE_STATUS_NEW = @"New_Status";
NSString * const CLOSETICKETARRAY = @"Close_Sar";
NSString * const PROBLEM_RESOLUTION_CODE = @"Resolution";
NSString * const CREATETICKETARRAY = @"Create_Ticket";
NSString * const TAKEINVENTORYARRAY = @"Inventory";
NSString * const CURRENT_INVENTORY_DATE = @"Current_Date";
NSString * const TAKEINVENTORYPARTSARRAY = @"Parts";

@implementation NexusModel


+ (NSMutableDictionary *) verifyLoginForID:(NSString *)employeeID Password:(NSString *)password
{
    NSLog (@"Verify Login");
    NSString *get = [NSString stringWithFormat:@"?%@=%@&%@=%@", EMPLOYEE_ID, employeeID, NEXUS_PWD, password];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, LOGIN_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getSarsForID:(NSString *) employeeID
{
    NSLog(@"Get SARSs");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", EMPLOYEE_ID, employeeID];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, GETSARS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getTransferrableTechsForTech:(NSString *) employeeID
{
    NSLog(@"Get SARSs");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", EMPLOYEE_ID, employeeID];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, GETTRANSFERTECHS_PAGE, get];
    return [self submitRequestToURL:url];
}


+ (NSMutableDictionary *) getPartsForMeter:(NSString *) meterNum
{
    NSLog(@"Get Parts for Meter");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", METER_NUMBER, meterNum];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, GETPARTS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getPartInfoForSerial:(NSString *) serialNum
{
    NSLog(@"Get Info for Serial");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", SERIAL_NUMBER, serialNum];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, PARTINFO_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) addParts:(NSArray *) parts ForMeter:(NSString *) meterNum
{
    NSLog(@"Add Parts");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", METER_NUMBER, meterNum];
    for (NSString *part in parts)
    {
        get = [get stringByAppendingFormat:@"&%@=%@", PARTSARRAY, part];
    }
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, ADDPARTS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) closeSar:(NSString *) sarNum withDate:(NSString *) currentDate andResolution:(NSString *) resCode
{
    NSLog(@"Close Sar");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", CLOSETICKETARRAY, SAR_NUM, sarNum];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", CLOSETICKETARRAY, CLOSE_DATE, currentDate];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", CLOSETICKETARRAY, RESOLUTION_CODE, resCode];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, CLOSETICKET_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) saveComment:(NSString *) comment ForSar:(NSString *) sarNum
{
    NSLog(@"Save Comments");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", COMMENTARRAY, SAR_NUM, sarNum];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", COMMENTARRAY, COMMENTS, comment];

    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, COMMENTS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) saveDMT:(NSString *) dmt AndAirbill:(NSString *) air ForSerial:(NSString *) serial
{
    NSLog(@"Save DMT and Airbill");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", DMTAIRBILLARRAY, SERIAL_NUMBER, serial];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", DMTAIRBILLARRAY, DMT_NUMBER, dmt];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", DMTAIRBILLARRAY, AIRBILL_NUMBER, air];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, DMTAIR_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) saveContactInfoForAccount:(NSString *) account withInfo:(NSMutableDictionary *) info
{
    NSLog(@"Save Contact Info");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", UPDATECONTACTARRAY, ACCOUNT_NUM, account];
    for (NSString *key in [info allKeys])
    {
        get = [get stringByAppendingFormat:@"&%@[%@]=%@", UPDATECONTACTARRAY, key, [info valueForKey:key]];
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, UPDATECONTACT_PAGE, get];
    return [self submitRequestToURL:url];
}


+ (NSMutableDictionary *) saveTimeTravel:(NSMutableDictionary *) info ForSar:(NSString *) sarNumber
{
    NSLog(@"Save Time Travel");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", TIMETRAVELARRAY, SAR_NUM, sarNumber];
    NSArray *keys = [info allKeys];
    for(NSString *key in keys)
    {
        get = [get stringByAppendingFormat:@"&%@[%@]=%@", TIMETRAVELARRAY, key, [info valueForKey:key]];
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, TIMETRAVEL_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) orderPartNum:(NSString *) part withQuantity:(NSString *) quantity forEmployee:(NSString *) employeeID andMeterNum:(NSString *) meterNum
{
    NSLog(@"Order Parts");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", ORDERPARTSARRAY, EMPLOYEE_ID, employeeID];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", ORDERPARTSARRAY, PART_NUMBER, part];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", ORDERPARTSARRAY, QUANTITY, quantity];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", ORDERPARTSARRAY, METER_NUMBER, meterNum];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, ORDERPARTS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) takeInventoryForMeter:(NSString *) meterNum withParts:(NSMutableArray *) parts andDate:(NSString *) currentDate
{
    NSLog(@"Take Inventory");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", TAKEINVENTORYARRAY, METER_NUMBER, meterNum];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", TAKEINVENTORYARRAY, CURRENT_INVENTORY_DATE, currentDate];
    for (NSString *part in parts)
        get = [get stringByAppendingFormat:@"&%@[%@][]=%@", TAKEINVENTORYARRAY, TAKEINVENTORYPARTSARRAY, part];    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, TAKEINVENTORY_PAGE
                     , get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) transferSar:(NSString *)sarNum toTech:(NSString *)techID
{
    NSLog (@"Transfer Ticket");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", TRANSFERTICKETARRAY, TRANSFER_TECH_ID, techID];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", TRANSFERTICKETARRAY, SAR_NUM, sarNum];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, TRANSFERTICKET_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) changeStatusForSar:(NSString *)sarNum toStatus:(NSString *)newStatus
{
    NSLog (@"Change SAR Status");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", CHANGESTATUSARRAY, SAR_NUM, sarNum];
    get = [get stringByAppendingFormat:@"&%@[%@]=%@", CHANGESTATUSARRAY, CHANGE_STATUS_NEW, newStatus];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, CHANGESTATUS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getResolutionCodesForProblemType:(NSString *)problemType
{
    NSLog (@"Resolution Codes");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", PROBLEM_TYPE, problemType];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, GETRESOLUTIONCODES_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getOrdersForID:(NSString *)employeeID
{
    NSLog (@"Orders");
    NSString *get = [NSString stringWithFormat:@"?%@=%@", EMPLOYEE_ID, employeeID];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, GETORDERS_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getPartsList
{
    NSLog (@"Parts List");
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASE, GETPARTSLIST_PAGE];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getStatusList
{
    NSLog (@"Status List");
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASE, GETSTATUSLIST_PAGE];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) getProblemCodeList
{
    NSLog (@"Problem Code List");
    NSString *url = [NSString stringWithFormat:@"%@%@", URL_BASE, GETPROBLEMCODELIST_PAGE];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) createTicket:(NSMutableDictionary *) info ForEmployee:(NSString *) employeeID
{
    NSLog(@"Save Time Travel");
    NSString *get = [NSString stringWithFormat:@"?%@[%@]=%@", CREATETICKETARRAY, EMPLOYEE_ID, employeeID];
    NSArray *keys = [info allKeys];
    for(NSString *key in keys)
    {
        get = [get stringByAppendingFormat:@"&%@[%@]=%@", CREATETICKETARRAY, key, [info valueForKey:key]];
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@", URL_BASE, CREATETICKET_PAGE, get];
    return [self submitRequestToURL:url];
}

+ (NSMutableDictionary *) submitRequestToURL:(NSString *) url
{
    // Submit Request
    NSString *escapedURL = [url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSLog(@"Submiting URL Request: '%@' ...", url);
    NSURL *urlRequest = [NSURL URLWithString:escapedURL];
    NSError  *err = nil;
    NSString *html = [NSString stringWithContentsOfURL:urlRequest
                                              encoding:NSUTF8StringEncoding error:&err];
    //AppDelegate *delegate = [[UIApplication sharedApplication] delegate];

    // Check for Errros
    if (err)
    {
        NSLog(@"Error Connection to '%@'. %@.. %@", url, err.localizedDescription, err.localizedFailureReason);
        //[delegate.activityIndicator stopAnimating];
        return nil;
    }
    else 
    {
        // Return JSON Dictionary
        //NSLog(@"URL Response: '%@'", html);
        NSMutableDictionary *dict = [html JSONValue];
        if (dict == NULL || [[dict objectForKey:@"request"] isEqualToString:@"failure"])
        {
            dict = nil;
            NSLog(@"Request Failure");
        }
        else 
        {
            if ([[dict objectForKey:@"request"] isEqualToString:@"success"])
                dict = [[NSMutableDictionary alloc] init];
            else {
                NSLog(@"Records Found!");
            }
            NSLog(@"Request Success");
        }
        //NSLog(@"Response Dict: %@", dict);
        //[delegate.activityIndicator stopAnimating];
        return dict;
    }
}


@end
