//
//  AppDelegate.m
//  iPullRequest
//
//  Created by Snowmanzzz on 7/25/14.
//  Copyright (c) 2014 Snowmanzzz. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate()

@property (weak) IBOutlet NSTextField *sourceBranchName;

@property (weak) IBOutlet NSTextField *targetBranchName;

@property (weak) IBOutlet NSTextField *sourceProjectID;

@property (weak) IBOutlet NSTextField *destinationProjectID;

@property (strong, nonatomic) NSMutableString *prURLPrefix;

@property (weak) IBOutlet NSTextField *accountName;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    // http://gitlab.corp.anjuke.com/zhengzhongzhao/Anjuke/merge_requests/new?utf8=%E2%9C%93&merge_request%5Bsource_project_id%5D=69&merge_request%5Bsource_branch%5D=zzhengzhong_7.6&merge_request%5Btarget_project_id%5D=24&merge_request%5Btarget_branch%5D=develop_i-anjuke_7.6
    self.prURLPrefix = [@"http://gitlab.corp.anjuke.com/" mutableCopy];
    // /Anjuke/merge_requests/new?utf8=%E2%9C%93&merge_request%5Bsource_project_id%5D=
    
}

- (IBAction)openPR:(id)sender {
    NSMutableString *prString;
    [prString appendString:self.prURLPrefix];
    [prString appendString:self.accountName.stringValue];
    [prString appendString:@"/Anjuke/merge_requests/new?utf8=%E2%9C%93&merge_request%5Bsource_project_id%5D="];
    [prString appendString:self.sourceProjectID.stringValue];
    [prString appendString:@"&merge_request%5Bsource_branch%5D="];
    [prString appendString:self.sourceBranchName.stringValue];
    [prString appendString:@"&merge_request%5Btarget_project_id%5D="];
    [prString appendString:self.destinationProjectID.stringValue];
    [prString appendString:@"&merge_request%5Btarget_branch%5D="];
    [prString appendString:self.targetBranchName.stringValue];
//    prString = [@"http://gitlab.corp.anjuke.com/zhengzhongzhao/Anjuke/merge_requests/new?utf8=%E2%9C%93&merge_request%5Bsource_project_id%5D=69&merge_request%5Bsource_branch%5D=zzhengzhong_7.6&merge_request%5Btarget_project_id%5D=24&merge_request%5Btarget_branch%5D=develop_i-anjuke_7.6" mutableCopy];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:prString]];

}

@end
