//
//  CourseSelectionVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseSelectionVC : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *courseSelectionPicker;
    NSMutableArray *courses;
}

- (void)populateCourses;

- (IBAction)saveCourseSelection:(id)sender;

@end
