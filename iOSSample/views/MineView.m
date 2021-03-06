//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "MineView.h"


@implementation MineView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    // 个人中心head
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 90)];
//    head.backgroundColor = [UIColor purpleColor];

    head.layer.borderColor = [[UIColor grayColor] CGColor];
    [head configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(375);
        layout.height = YGPointValue(90);
        layout.marginLeft = YGPointValue(0);
        layout.paddingHorizontal = YGPointValue(10);

        layout.alignItems = YGAlignCenter;
        layout.flexDirection = YGFlexDirectionRow;
    }];
    // 绘制底边框
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, head.frame.size.height - 1, head.frame.size.width, 1);
    layer.backgroundColor = [[UIColor grayColor] CGColor];

    [head.layer addSublayer:layer];

    UIView *avatar = [[UIView alloc] initWithFrame:CGRectZero];
    avatar.backgroundColor = [UIColor blueColor];
    avatar.layer.masksToBounds = YES;
    avatar.layer.cornerRadius = 35;
    [avatar configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(70);
        layout.height = YGPointValue(70);
        layout.marginRight = YGPointValue(10);
    }];

    UIView *headMain = [[UIView alloc] initWithFrame:CGRectZero];
//    headMain.backgroundColor = [UIColor whiteColor];
    [headMain configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.flex = 1;
        layout.height = YGPointValue(80);
        layout.paddingTop = YGPointValue(5);
    }];

//    UILabel *headUsername = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    UILabel *headUsername = [[UILabel alloc] init];
//    headUsername.backgroundColor = [UIColor yellowColor];
    headUsername.text = @"1232131";
    headUsername.numberOfLines = 0;
    headUsername.font = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    [headUsername configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.flex = 1;
        layout.height = YGPointValue(18);
        layout.flexShrink = 1;
    }];
//    headUsername.yoga.flexShrink = 1;

    UILabel *headSign = [[UILabel alloc] initWithFrame:CGRectZero];
    headSign.text = @"用户签名签名";
    headSign.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
    headSign.textColor = [UIColor grayColor];
    [headSign configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.flex = 1;
        layout.height = YGPointValue(20);

    }];

    [head addSubview:avatar];
    [head addSubview:headMain];

    [head.yoga applyLayoutPreservingOrigin:NO];

    [headMain addSubview:headUsername];
    [headMain addSubview:headSign];

    // login btn
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    loginBtn.backgroundColor = [UIColor redColor];
    [loginBtn setTitle:@"退出登录" forState:UIControlStateNormal];


    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [loginBtn addTarget:self action:@selector(toLogin) forControlEvents:UIControlEventTouchUpInside];

    [loginBtn configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(325);

        layout.marginTop = YGPointValue(20);
        layout.alignSelf = YGAlignCenter;
        layout.height = YGPointValue(50);
    }];


    [self configureLayoutWithBlock:^(YGLayout *_Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.width = YGPointValue(375);
        layout.marginTop = YGPointValue(64);
        layout.marginBottom = YGPointValue(0);
    }];

    [self addSubview:head];

    [self addSubview:loginBtn];


    [self.yoga applyLayoutPreservingOrigin:NO];

    return self;
}

- (void)toLogin {
    [self.delegate doClickLogin];
}


@end