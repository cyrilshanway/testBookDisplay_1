//
//  BookViewController.h
//  testBookDisplay_1
//
//  Created by Cyrilshanway on 2014/11/24.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookViewController : UIViewController

@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *email;

// book
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *ISBNNum;

@property (nonatomic, strong) NSString *bookPublished;
@property (nonatomic, strong) NSString *bookPublisher;
@property (nonatomic, strong) UIImage *imageAuthor;

@property (nonatomic, strong) NSString *smallImgUrl;
@property (nonatomic, strong) NSString *pageNum;
//author
@property (nonatomic, strong) NSString *name;


@property (nonatomic, weak) NSMutableDictionary *smallImgUrlDic;
@end
