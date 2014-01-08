//
//  LocationDetailsViewController.m
//  MyLocations
//
//  Created by John Hopkins on 06/01/2014.
//  Copyright (c) 2014 cocoacoda. All rights reserved.
//

#import "LocationDetailsViewController.h"

@interface LocationDetailsViewController ()

@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UILabel *latitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *longitudeLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@end

@implementation LocationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad]; self.descriptionTextView.text = @"";
    self.categoryLabel.text = @"";
    self.latitudeLabel.text = [NSString stringWithFormat:
                               @"%.8f", self.coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat: @"%.8f", self.coordinate.longitude];
    if (self.placemark != nil) { self.addressLabel.text = [self stringFromPlacemark:self.placemark];
    } else {
        self.addressLabel.text = @"No Address Found";
        }
        
        self.dateLabel.text = [self formatDate:[NSDate date]];
}

- (NSString *)stringFromPlacemark:(CLPlacemark *)placemark {
    return [NSString stringWithFormat:@"%@ %@, %@, %@ %@, %@", placemark.subThoroughfare, placemark.thoroughfare, placemark.locality, placemark.administrativeArea, placemark.postalCode, placemark.country];
}

- (NSString *)formatDate:(NSDate *)theDate {
    static NSDateFormatter *formatter = nil; if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init]; [formatter setDateStyle:NSDateFormatterMediumStyle]; [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    return [formatter stringFromDate:theDate];
}

- (IBAction)done:(id)sender
{

    [self closeScreen];
    
}

- (IBAction)cancel:(id)sender
{
    
    [self closeScreen];
    
}

- (void)closeScreen
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 88;
    } else if (indexPath.section == 2 && indexPath.row == 2) {
        
        
        CGRect rect = CGRectMake(100, 10, 205, 10000);
        self.addressLabel.frame = rect;
        [self.addressLabel sizeToFit];
        
        rect.size.height = self.addressLabel.frame.size.height;
        self.addressLabel.frame = rect;
        
        return self.addressLabel.frame.size.height + 20;
    } else {
        return 44;
    }
}

@end