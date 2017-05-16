//
//  ViewController.h
//  PickerTest
//
//  Created by Anton Orzes on 16/05/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate>
{
    NSMutableArray *monthsArray;
    NSMutableArray *yearsArray;
    NSDateComponents *currentDateComponents;
    NSArray *boje;
}

@end

