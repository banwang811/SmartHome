//
//  ViewController.m
//  SideBarNavDemo
//
//  Created by JianYe on 12-12-11.
//  Copyright (c) 2012年 JianYe. All rights reserved.
//

#import "SidebarViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "LeftSideBarViewController.h"

@interface SidebarViewController ()
{
    UIViewController  *_currentMainController;
    UITapGestureRecognizer *_tapGestureRecognizer;
    UIPanGestureRecognizer *_panGestureReconginzer;
    BOOL sideBarShowing;
    CGFloat currentTranslate;
}
@property (strong,nonatomic)LeftSideBarViewController *leftSideBarViewController;

@end

@implementation SidebarViewController

static SidebarViewController *rootViewCon;

const int ContentOffset = 230;
const int ContentMinOffset = 60;
const float MoveAnimationDuration = 0.3;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

+ (id)share
{
    return rootViewCon;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (rootViewCon) {
        rootViewCon = nil;
    }
	rootViewCon = self;
    
    sideBarShowing = NO;
    currentTranslate = 0;
    
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentView.layer.shadowOpacity = 1;
    
    LeftSideBarViewController *_leftCon = [[LeftSideBarViewController alloc] init];
    _leftCon.delegate = self;
    self.leftSideBarViewController = _leftCon;
    [self addChildViewController:self.leftSideBarViewController];
    self.leftSideBarViewController.view.frame = self.navBackView.bounds;
    [self.navBackView addSubview:self.leftSideBarViewController.view];
    
    _panGestureReconginzer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panInContentView:)];
    [self.contentView addGestureRecognizer:_panGestureReconginzer];
}

- (void)contentViewAddTapGestures
{
    if (_tapGestureRecognizer) {
        [self.contentView removeGestureRecognizer:_tapGestureRecognizer];
        _tapGestureRecognizer = nil;
    }
    
    _tapGestureRecognizer = [[UITapGestureRecognizer  alloc] initWithTarget:self action:@selector(tapOnContentView:)];
    [self.contentView addGestureRecognizer:_tapGestureRecognizer];
}

- (void)tapOnContentView:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self moveAnimationWithDirection:SideBarShowDirectionNone duration:MoveAnimationDuration];
}

- (void)panInContentView:(UIPanGestureRecognizer *)panGestureReconginzer
{
	if (panGestureReconginzer.state == UIGestureRecognizerStateChanged){
        CGFloat translation = [panGestureReconginzer translationInView:self.contentView].x;
        if (translation > 0 || (translation<0 && sideBarShowing)) {
            self.contentView.transform = CGAffineTransformMakeTranslation(translation + currentTranslate, 0);
            UIView *view ;
            if (translation + currentTranslate > 0){
                view = self.leftSideBarViewController.view;
                [self.navBackView bringSubviewToFront:view];
                
            }
            [self.navBackView bringSubviewToFront:view];
        }
        
	}else if (panGestureReconginzer.state == UIGestureRecognizerStateEnded){
		currentTranslate = self.contentView.transform.tx;
        if (!sideBarShowing) {
            if (fabs(currentTranslate) < ContentMinOffset) {
                [self moveAnimationWithDirection:SideBarShowDirectionNone duration:MoveAnimationDuration];
            }else if(currentTranslate > ContentMinOffset){
                [self moveAnimationWithDirection:SideBarShowDirectionLeft duration:MoveAnimationDuration];
            }
        }else{
            if (fabs(currentTranslate)<ContentOffset - ContentMinOffset) {
                [self moveAnimationWithDirection:SideBarShowDirectionNone duration:MoveAnimationDuration];
            }else if(currentTranslate>ContentOffset - ContentMinOffset){
                [self moveAnimationWithDirection:SideBarShowDirectionLeft duration:MoveAnimationDuration];
            }
        }
	}
}

#pragma mark - nav con delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([navigationController.viewControllers count] > 1) {
        [self removepanGestureReconginzerWhileNavConPushed:YES];
    }else{
        [self removepanGestureReconginzerWhileNavConPushed:NO];
    }
}

- (void)removepanGestureReconginzerWhileNavConPushed:(BOOL)push{
    if (push) {
        if (_panGestureReconginzer) {
            [self.contentView removeGestureRecognizer:_panGestureReconginzer];
            _panGestureReconginzer = nil;
        }
    }else{
        if (!_panGestureReconginzer) {
            _panGestureReconginzer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panInContentView:)];
            [self.contentView addGestureRecognizer:_panGestureReconginzer];
        }
    }
}
#pragma mark - side bar select delegate
- (void)leftSideBarSelectWithController:(UIViewController *)controller
{
    if ([controller isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)controller setDelegate:self];
    }
    if (_currentMainController == nil) {
        
		controller.view.frame = self.contentView.bounds;
		_currentMainController = controller;
		[self addChildViewController:_currentMainController];
		[self.contentView addSubview:_currentMainController.view];
		[_currentMainController didMoveToParentViewController:self];
        
	} else if (_currentMainController != controller && controller !=nil) {
        
		controller.view.frame = self.contentView.bounds;
		[_currentMainController willMoveToParentViewController:nil];
		[self addChildViewController:controller];
		self.view.userInteractionEnabled = NO;
		[self transitionFromViewController:_currentMainController
						  toViewController:controller
								  duration:0
								   options:UIViewAnimationOptionTransitionNone
								animations:^{}
								completion:^(BOOL finished){
									self.view.userInteractionEnabled = YES;
									[_currentMainController removeFromParentViewController];
									[controller didMoveToParentViewController:self];
									_currentMainController = controller;
								}
         ];
	}
    
    [self showSideBarControllerWithDirection:SideBarShowDirectionNone];
}

- (void)showSideBarControllerWithDirection:(SideBarShowDirection)direction
{
    if (direction!=SideBarShowDirectionNone) {
    
        if (direction == SideBarShowDirectionLeft)
        {
           UIView *view = self.leftSideBarViewController.view;
           [self.navBackView bringSubviewToFront:view];
        }
    }
    [self moveAnimationWithDirection:direction duration:MoveAnimationDuration];
}


-  (void)showSideBarControllerWithDirection{
    if (sideBarShowing) {
        [self moveAnimationWithDirection:SideBarShowDirectionNone duration:MoveAnimationDuration];
    }else{
        [self moveAnimationWithDirection:SideBarShowDirectionLeft duration:MoveAnimationDuration];
    }
}

#pragma animation

- (void)moveAnimationWithDirection:(SideBarShowDirection)direction duration:(float)duration
{
    self.contentView.userInteractionEnabled = NO;
    self.navBackView.userInteractionEnabled = NO;
    
    void (^completion)(BOOL finish) = ^(BOOL finish){
        self.contentView.userInteractionEnabled = YES;
        self.navBackView.userInteractionEnabled = YES;
        if (direction == SideBarShowDirectionNone) {
            
            if (_tapGestureRecognizer) {
                [self.contentView removeGestureRecognizer:_tapGestureRecognizer];
                _tapGestureRecognizer = nil;
            }
            sideBarShowing = NO;
            
        }else
        {
            [self contentViewAddTapGestures];
            sideBarShowing = YES;
        }
        currentTranslate = self.contentView.transform.tx;
    };
    
    switch (direction) {
        case SideBarShowDirectionNone:
        {
            [UIView animateWithDuration:duration
                             animations:^{
                self.contentView.transform  = CGAffineTransformMakeTranslation(0, 0);
            } completion:completion];
        }
            break;
        case SideBarShowDirectionLeft:
        {
            [UIView animateWithDuration:1.2
                                  delay:0
                 usingSpringWithDamping:0.5
                  initialSpringVelocity:1
                                options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 self.contentView.transform  = CGAffineTransformMakeTranslation(ContentOffset, 0);
                             } completion:completion];
        }
            break;
        default:
            break;
    }
}

@end
