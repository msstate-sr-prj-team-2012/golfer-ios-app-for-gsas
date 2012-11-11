//
//  CourseSelectionVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface CourseSelectionVC : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *courseSelectionPicker;
    NSMutableArray *courseNames;
    NSMutableArray *courseIDs;
    NSDictionary *courseDict;
    NSString *selectedCourseName;
    NSString *selectedCourseID;
}

- (void)getCourses;

- (IBAction)saveSelection:(id)sender;

@end
