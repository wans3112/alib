//
//  AVO_ViewController.m
//  AVOSDKTest
//
//  Created by Zhengji Tao on 12/2/13.
//  Copyright (c) 2013 Ramytech. All rights reserved.
//

#import "AVO_ViewController.h"
#import "NVBasicClient.h"
#import "NVInMemoryKeyMananger.h"
#import "AVOMomentBillPayment.h"

@interface AVO_ViewController ()

@end

@implementation AVO_ViewController
@synthesize button, client, keyMananger;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.keyMananger = [[NVInMemoryKeyMananger alloc] init];
    [self initUser:self.keyMananger];
    self.client = [[NVBasicClient alloc] initWithKeyManager:self.keyMananger];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonPressed:(id)sender {
    [self performSelectorInBackground:@selector(doStart) withObject:nil];
}

- (void) doStart {
    NSLog(@"start");
    NVInMemoryKeyMananger *km = [[NVInMemoryKeyMananger alloc] init];
    [self initUser:km];

    NVBasicClient *client = [[NVBasicClient alloc] initWithKeyManager:km];
//    [self testCreateLocalUser:client];
    
//    [self testUploadAvatar:self.client];
//    [self testUploadPhoto:self.client];
//    [self testGetUser:self.client];
//    [self testCreateTrip:self.client];
//    [self testGetTrips:self.client];
//    [self testGetTrip:self.client];
//    [self testCreateMomentNote:self.client];
//    [self testCreateMomentPhoto:self.client];
//    [self testCreateMomentBill:self.client];
//    [self testGetMoments:self.client];
//    [self testGetMomentBill:self.client];
//    [self testUpdateBillPayments:self.client];
//    [self testGetBillPayments:self.client];
//    [self testCreateMomentComment:self.client];
//    [self testGetMomentComment:self.client];
//    [self testUpdateTripMember:self.client];
//    [self testGetTripMembers:self.client];
    [self testGetImage:self.client];
}

- (void) initUser:(id<AVOKeyManager>) km {
    AVOLocalCredential *credential = [[AVOLocalCredential alloc] init];
    credential.email = @"binwang@gmail.com";
    credential.passHash = @"1111111111";
    [km storeUserCredential:credential];
}

- (void) testCreateLocalUser:(id<AVOClient>) client {
    AVOAPICreateLocalUserRequest *request = [[AVOAPICreateLocalUserRequest alloc] init];
    AVOUser *user = [[AVOUser alloc] init];
    AVOLocalCredential *credential = [[AVOLocalCredential alloc] init];
    
    user.firstname = @"Bin";
    user.lastname = @"wang";
    user.email = @"binwang@gmail.com";
    user.desc = @"Testor";
    user.imageID = 19l;
    
    credential.email = @"binwang@gmail.com";
    credential.passHash = @"1111111111";
    
    request.user = user;
    request.localcre = credential;
    
    @try {
        AVOAPICreateLocalUserResponse *response = [client createLocalUser:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create localuser.");
    }
}

- (void) testUploadAvatar:(id<AVOClient>) client {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]];
    @try {
        AVOAPICreateImageResponse *response = [client updateAvatar:url];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test upload avatar.");
    }
    
}

- (void) testUploadPhoto:(id<AVOClient>) client {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"jpg"]];
    @try {
        AVOAPICreateImageResponse *response = [client updatePhoto:url];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test upload avatar.");
    }
}

- (void) testGetUser:(id<AVOClient>) client {
    @try {
        AVOAPIGetUserResponse *response = [client getUser:3l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get user.");
    }
}

- (void) testCreateTrip:(id<AVOClient>) client {
    AVOAPICreateTripSummaryRequest *request = [[AVOAPICreateTripSummaryRequest alloc] init];
    AVOTripSummary *summary = [[AVOTripSummary alloc] init];
    NSArray *users = [NSArray arrayWithObjects: nil];
    
    summary.title = @"Test Trip 1";
    summary.sdate = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue] * 1000;
    summary.destination = @"Beijing";
    summary.bannerID = 20l;
    
    request.trip = summary;
    request.users = users;
    
    @try {
        AVOAPICreateTripSummaryResponse *response = [client createTrip:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create trip.");
    }
}

- (void) testGetTrips:(id<AVOClient>) client {
    @try {
        AVOAPIGetTripsResponse *response = [client getTrips:0l and:10];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get trips.");
    }
}

- (void) testGetTrip:(id<AVOClient>) client {
    @try {
        AVOAPIGetTripResponse *response = [client getTrip:5l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get trip.");
    }
}

- (void) testCreateMomentNote:(id<AVOClient>) client {
    AVOAPICreateMomentRequest *request = [[AVOAPICreateMomentRequest alloc] init];
    AVOMoment *moment = [[AVOMoment alloc] init];
    AVOMomentNote *note = [[AVOMomentNote alloc] init];
    
    note.text = @"New Trip~";
    
    moment.sdate = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue] * 1000;
    moment.note = note;
    
    request.moment = moment;
    request.tripID = 5l;
    
    @try {
        AVOAPICreateMomentResponse *response = [client createMoment:5l and:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create moment note.");
    }
}

- (void) testCreateMomentPhoto:(id<AVOClient>) client {
    AVOAPICreateMomentRequest *request = [[AVOAPICreateMomentRequest alloc] init];
    AVOMoment *moment = [[AVOMoment alloc] init];
    AVOMomentPhoto *photo = [[AVOMomentPhoto alloc] init];

    photo.imageID = 20l;
    
    moment.sdate = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue] * 1000;
    moment.photo = photo;
    
    request.moment = moment;
    request.tripID = 5l;
    
    @try {
        AVOAPICreateMomentResponse *response = [client createMoment:5l and:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create moment photo.");
    }
}

- (void) testCreateMomentBill:(id<AVOClient>) client {
    AVOAPICreateMomentRequest *request = [[AVOAPICreateMomentRequest alloc] init];
    AVOMoment *moment = [[AVOMoment alloc] init];
    AVOMomentBill *bill = [[AVOMomentBill alloc] init];
    
    bill.amout = 19.99;
    bill.currency = avoBillCurrencyRMB;
    bill.category = @"meal";
    
    moment.sdate = [[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue] * 1000;
    moment.bill = bill;
    
    request.moment = moment;
    request.tripID = 5l;
    
    @try {
        AVOAPICreateMomentResponse *response = [client createMoment:5l and:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create moment bill.");
    }
}

- (void) testGetMoments:(id<AVOClient>) client {
    @try {
        AVOAPIGetMomentsResponse *response = [client getMoments:5l and:0l and:10];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get moments.");
    }
}

- (void) testGetMomentBill:(id<AVOClient>) client {
    @try {
        AVOAPIGetBillDetailResponse *response = [client getMomentBill:2l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get bill detail.");
    }
}

- (void) testUpdateBillPayments:(id<AVOClient>) client {
    AVOAPICreateBillPaymentRequest *request = [[AVOAPICreateBillPaymentRequest alloc] init];
    
    AVOMomentBillPayment *pay1 = [[AVOMomentBillPayment alloc] init];
    pay1.billID = 2l;
    pay1.userID = 3l;
    pay1.consumed = 11.0l;
    pay1.paid = 18.0l;
    pay1.paymentID = 2l;
    
    NSMutableArray *payments = [[NSMutableArray alloc] init];
    [payments addObject:pay1];
    
    request.payments = payments;
    
    NSLog(@"Req:%@", [request toDictionary]);
    
    @try {
        BOOL ret = [client updateBillPayment:2l and:request];
        NSLog(@"Res:%d", ret);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test update payments.");
    }
}

- (void) testGetBillPayments:(id<AVOClient>) client {
    @try {
        AVOAPIGetBillPaymentsResponse *response = [client getBillPayments:2l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get payments.");
    }
}

- (void) testCreateMomentComment:(id<AVOClient>) client {
    AVOAPICreateMomentCommentRequest *request = [[AVOAPICreateMomentCommentRequest alloc] init];
    
    AVOMomentComment *comment = [[AVOMomentComment alloc] init];
    comment.posterID = 3l;
    comment.text = @"nice try~";
    
    request.comment = comment;
    
    @try {
        AVOAPICreateMomentCommentResponse *response = [client createMomentComment:6l and:request];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test create moment comment.");
    }
}

- (void) testGetMomentComment:(id<AVOClient>) client {
    @try {
        AVOAPIGetMomentCommentsResponse *response = [client getMomentComments:6l and:0l and:10];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get moment comments.");
    }
}

- (void) testUpdateTripMember:(id<AVOClient>) client {
    AVOAPIUpdateTripMemberRequest *request = [[AVOAPIUpdateTripMemberRequest alloc] init];
    
    AVOUserTripShip *ship = [[AVOUserTripShip alloc] init];
    ship.userID = 3l;
    ship.tripID = 6l;
    ship.status = avoUserTripShipStatusMember;
    
    request.member = ship;
    request.tripCode = @"9284877bc58633ecc479a849d2da4844";
    
    @try {
        BOOL ret = [client updateTripMemberShip:6l and:request];
        NSLog(@"Res:%d", ret);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test update trip member ship.");
    }
}

- (void) testGetTripMembers:(id<AVOClient>) client {
    @try {
        AVOAPIGetTripMembersResponse *response = [client getTripMembers:6l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get trip members.");
    }
}

- (void) testGetImage:(id<AVOClient>) client {
    @try {
        AVOAPIGetImageResponse *response = [client getImage:19l];
        NSLog(@"Res:%@", [response toDictionary]);
    }
    @catch (NSException *exception) {
        NSLog(@"Exception:%@", [exception description]);
    }
    @finally {
        NSLog(@"Finish test get image.");
    }
}

@end
