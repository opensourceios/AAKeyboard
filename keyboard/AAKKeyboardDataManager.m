//
//  AAKKeyboardDataManager.m
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/20.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import "AAKKeyboardDataManager.h"

#import "AAKHelper.h"

#import "AAKLocalKeyboardDataManager.h"
#import "AAKSharedKeyboardDataManager.h"

NSString *const AAKKeyboardDataManagerDidCreateNewGroupNotification = @"AAKKeyboardDataManagerDidCreateNewGroupNotification";

static AAKKeyboardDataManager *sharedKeyboardDataManager = nil;

@implementation AAKKeyboardDataManager

+ (AAKKeyboardDataManager*)defaultManager {
	if (sharedKeyboardDataManager == nil) {
		if ([AAKKeyboardDataManager isOpenAccessGranted]) {
			sharedKeyboardDataManager = [[AAKSharedKeyboardDataManager alloc] init];
		}
		else {
			sharedKeyboardDataManager = [[AAKLocalKeyboardDataManager alloc] init];
		}
	}
	return sharedKeyboardDataManager;
}

+ (BOOL)isOpenAccessGranted {
	NSError *error = nil;
	NSFileManager *fm = [NSFileManager defaultManager];
	NSString *containerPath = [[fm containerURLForSecurityApplicationGroupIdentifier:@"group.com.sonson.AAKeyboardApp"] path];
	
	[fm contentsOfDirectoryAtPath:containerPath error:&error];
	
	if(error != nil){
		DNSLog(@"Full Access: Off , %@", [error localizedDescription]);
		return NO;
	}
	
	DNSLog(@"Full Access On");
	return YES;
}

/**
 * AAKSSQLiteオブジェクトのトランザクションを開始する．
 */
- (void)beginTransaction {
}

/**
 * AAKSSQLiteオブジェクトのトランザクションをコミット，終了する．
 */
- (void)commitTransaction {
}

/**
 * テーブルを作成する．
 */
- (void)initializeDatabaseTable {
}

#pragma mark - Group

/**
 * グループ一覧を作成する．
 * @return グループ名の配列．
 **/
- (NSArray*)groups {
	return nil;
}

/**
 * 新しいグループを作成する．
 * @param group 新しいグループ名の文字列．
 **/
- (void)insertNewGroup:(NSString*)group {
}

/**
 * 新しいAAを追加する．
 * @param asciiArt アスキーアート本体．文字列．
 * @param group アスキーアートのグループのSQLiteデータベースのキー．
 **/
- (void)insertNewASCIIArt:(NSString*)asciiArt groupKey:(NSInteger)groupKey {
}

@end
