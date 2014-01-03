//
//  ViewController.m
//  ColorTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIImageView *colorView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
-(IBAction)onColorSliderChanged:(id)sender;



@end

@implementation ViewController


-(IBAction)onColorSliderChanged:(id)sender{
    if([_activityIndicator isAnimating]){
        [_activityIndicator stopAnimating];
    }
    
    _colorView.backgroundColor=
    [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1.0];
}

- (IBAction)powerOnOff:(id)sender {
    
    BOOL isOn = ((UISwitch*)sender).on;
    
    
    _redSlider.enabled = isOn;
    _greenSlider.enabled = isOn;
    _blueSlider.enabled = isOn;
    
    
    if(isOn){
        [_activityIndicator startAnimating];
        [self performSelector:@selector(onColorSliderChanged:) withObject:nil afterDelay:1.0];
        
    }
    
    
    else{
        
        _colorView.backgroundColor = [UIColor grayColor];
    }
    
    
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    [self onColorSliderChanged:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
