//
//  ViewController.m
//  TintImageView
//
//  Created by YLCHUN on 2017/11/10.
//  Copyright © 2017年 YLCHUN. All rights reserved.
//

#import "ViewController.h"
#import "TintImageView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TintImageView *tintImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)tapAction:(id)sender {
    static int i = 0;
    bool b = (i++ % 2) != 0;
    self.tintImageView.highlighted = b;
    self.imageView.highlighted = b;
}


@end
