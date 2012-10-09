//
//  GolferChangeVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#define GOLFER 0

@interface GolferChangeVC : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *golferSelectionPicker;
    NSMutableArray *golfers;
}

- (void)populateGolfers;
@end
