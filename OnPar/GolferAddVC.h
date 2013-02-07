//
//  GolferAddVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface GolferAddVC : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *teeSelectionPicker;
    NSMutableArray *tees;
    NSMutableDictionary *tees2;
}

@property (weak, nonatomic) IBOutlet UITextField *golferNickname;
@property (weak, nonatomic) IBOutlet UITextField *golferIdTextField;

- (IBAction)saveGolferInfo:(id)sender;

- (void)populateTeeDictionary;

@end
