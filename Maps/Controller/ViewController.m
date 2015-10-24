//
//  ViewController.m
//  Maps
//
//  Created by Treinamento Mobile on 10/24/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property(nonatomic, weak) IBOutlet MKMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"MASP";
    annotation.subtitle = @"São Paulo";
    annotation.coordinate = CLLocationCoordinate2DMake(-23.56136640838073, -46.6562633199172);
    [self.mapView showAnnotations:@[annotation] animated:YES];
    [self.mapView selectAnnotation:annotation animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
