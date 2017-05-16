//
//  ViewController.m
//  PickerTest
//
//  Created by Anton Orzes on 16/05/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    boje = @[@1,@3,@5,@6];//tu se definira što će biti crveno
    currentDateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    //Array for picker view
    monthsArray=[[NSMutableArray alloc]initWithObjects:@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec",nil];
    yearsArray=[[NSMutableArray alloc]init];
    
    NSString *yearString = @"2015";
    for (int i=0; i<3; i++)
    {
        [yearsArray addObject:[NSString stringWithFormat:@"%d",[yearString intValue]+i]];
    }
    
    UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, 320, 200)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [myPickerView selectRow:[currentDateComponents month]-1 inComponent:0 animated:YES];
    [self.view addSubview:myPickerView];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger rowsInComponent;
    if (component==0) {
        rowsInComponent=[monthsArray count];
    }
    else {
        rowsInComponent=[yearsArray count];
    }
    return rowsInComponent;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if ([pickerView selectedRowInComponent:0]+1<[currentDateComponents month] && [[yearsArray objectAtIndex:[pickerView selectedRowInComponent:1]] intValue]==[currentDateComponents year]) {
        [pickerView selectRow:[currentDateComponents month]-1 inComponent:0 animated:YES];
        NSLog(@"Need to shift");
    }
    
    if (component==1) {
        [pickerView reloadComponent:0];
    }
    
    NSLog(@"%ld,%@",component,component==0?[monthsArray objectAtIndex:row]:[yearsArray objectAtIndex:row]);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
    label.text = component==0?[monthsArray objectAtIndex:row]:[yearsArray objectAtIndex:row];
    
    if (component==0)
    {
        if (row+1<[currentDateComponents month] && [[yearsArray objectAtIndex:[pickerView selectedRowInComponent:1]] intValue]==[currentDateComponents year]) {
                label.textColor = [UIColor grayColor];
        }
        for (NSNumber *broj in boje) {
        if (row==[broj integerValue]) {
            label.textColor = [UIColor redColor];
        }
        }
    }
    return label;
}
// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat componentWidth ;
    
    if (component==0) {
        componentWidth = 100;
    }
    else  {
        componentWidth = 100;
    }
    return componentWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
