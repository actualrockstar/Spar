//
//  ViewController.m
//  Spår
//
//  Created by Nassir Ali on 4/22/20.
//  Copyright © 2020 Nassir Ali. All rights reserved.
//

#import "ViewController.h"
#import "WorkoutViewController.h"
@import Firebase;



@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *profileBUtton;
@property (weak, nonatomic) IBOutlet UIButton *workoutButton;
@property (weak, nonatomic) IBOutlet UIButton *runButton;
@property (weak, nonatomic) NSMutableArray *workouts;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *faster;
@property (weak, nonatomic) IBOutlet UILabel *stronger;
@property (weak, nonatomic) IBOutlet UILabel *yourself;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@end

@implementation ViewController{
    NSString *userName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _runButton.layer.cornerRadius = 30;
    [_runButton.layer setShadowOffset:CGSizeMake(5, 5)];
    [_runButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_runButton.layer setShadowOpacity:0.5];
    
    _workoutButton.layer.cornerRadius = 30;
    [_workoutButton.layer setShadowOffset:CGSizeMake(5, 5)];
    [_workoutButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_workoutButton.layer setShadowOpacity:0.5];
    
    _profileBUtton.layer.cornerRadius = 50;
    [_profileBUtton.layer setShadowOffset:CGSizeMake(5, 5)];
    [_profileBUtton.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_profileBUtton.layer setShadowOpacity:0.5];
    
    _nameLabel.layer.cornerRadius = 10;
    _nameLabel.layer.borderColor = [[UIColor whiteColor] CGColor];
    _nameLabel.layer.borderWidth = 3;
    [_nameLabel.layer setShadowOffset:CGSizeMake(5, 5)];
    [_nameLabel.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_nameLabel.layer setShadowOpacity:0.5];
    
    _faster.layer.cornerRadius = 10;
    [_faster.layer setShadowOffset:CGSizeMake(5, 5)];
    [_faster.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_faster.layer setShadowOpacity:0.5];
    
    _stronger.layer.cornerRadius = 10;
    [_stronger.layer setShadowOffset:CGSizeMake(5, 5)];
    [_stronger.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_stronger.layer setShadowOpacity:0.5];
    
    _yourself.layer.cornerRadius = 10;
    [_yourself.layer setShadowOffset:CGSizeMake(5, 5)];
    [_yourself.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [_yourself.layer setShadowOpacity:0.5];
    // Do any additional setup after loading the view.
    
    [self configureDatabase];
    //[self configureTable];

}

-(void)configureDatabase{
    _ref = [[[[FIRDatabase database] reference] child:@"users"] child:[FIRAuth auth].currentUser.uid];
  
    [_ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
      NSDictionary *postDict = snapshot.value;
        self->userName = [postDict valueForKeyPath:@"name"];
        NSLog(@"%@", self->userName);
        NSString* welcome = @"Welcome back, ";
        //NSString* message = [welcome stringByAppendingString:self->userName];
        //self->_nameLabel.text = message;
    }];
    
    }



@end
