//
//  GolferAddVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GolferAddVC : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    __weak IBOutlet UIPickerView *teeSelectionPicker;
    NSMutableArray *tees;
}

@property (weak, nonatomic) IBOutlet UITextField *golferNickname;
@property (weak, nonatomic) IBOutlet UITextField *golferIdTextField;

- (IBAction)saveGolferInfo:(id)sender;

- (void)populateTees;

@end
