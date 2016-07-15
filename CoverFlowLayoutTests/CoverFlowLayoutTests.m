//
//  CoverFlowLayoutTests.m
//  CoverFlowLayoutTests
//
//  Created by thomas minshull on 2016-07-14.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoverFlowLayout.h"
#import "RootCollectionViewController.h"

@interface CoverFlowLayoutTests : XCTestCase

@property (strong, nonatomic)CoverFlowLayout *layout;
@property (strong, nonatomic)RootCollectionViewController *rootCVC;

@end

@implementation CoverFlowLayoutTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
