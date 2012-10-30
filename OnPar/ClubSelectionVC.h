//
//  ClubSelectionVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CLUBTYPE 0
#define CLUBNUMBER 1

@interface ClubSelectionVC : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *clubSelectionPicker;
    NSMutableArray *clubType;
    NSMutableArray *woodNum;
    NSMutableArray *hybridNum;
    NSMutableArray *ironNum;
    NSMutableArray *wedgeType;
}

- (void)populateClubArrays;

- (IBAction)saveClubSelection:(id)sender;

@end
