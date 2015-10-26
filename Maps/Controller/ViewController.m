//
//  ViewController.m
//  Maps
//
//  Created by Treinamento Mobile on 10/24/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>
@property(nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UITextField *addres;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//    annotation.title = @"MASP";
//    annotation.subtitle = @"São Paulo";
//    annotation.coordinate = CLLocationCoordinate2DMake(-23.56136640838073, -46.6562633199172);
//    [self.mapView showAnnotations:@[annotation] animated:YES];
//    [self.mapView selectAnnotation:annotation animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSString *identifier = @"MyPin";
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil; }
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
    }
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.layer.cornerRadius = 15.0f;
    imageView.layer.masksToBounds = YES;
    imageView.image = [UIImage imageNamed:@"masp"];
    annotationView.rightCalloutAccessoryView = imageView;
    return annotationView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)updateMapOnTap:(id)sender{
    NSLog(@"addres %@",  self.addres.text);
    NSString *addres = self.addres.text;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString: addres completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark* aPlacemark in placemarks)
        {
            // Process the placemark.
            NSString *latDest1 = [NSString stringWithFormat:@"%.4f",aPlacemark.location.coordinate.latitude];
            NSString *lngDest1 = [NSString stringWithFormat:@"%.4f",aPlacemark.location.coordinate.longitude];

            NSLog(@"lat: %@, lng: %@", latDest1, lngDest1);
            
            ///// Parse to double
            double latitude = [latDest1 doubleValue];
            double longitude = [lngDest1 doubleValue];
            
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            annotation.title = @"MASP";
            annotation.subtitle = @"São Paulo";
            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            [self.mapView showAnnotations:@[annotation] animated:YES];
            [self.mapView selectAnnotation:annotation animated:YES];
            /////
        }
    }];
    
    
    }


@end
