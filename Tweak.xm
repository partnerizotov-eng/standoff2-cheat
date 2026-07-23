#import <UIKit/UIKit.h>
#import <objc/runtime.h>

%hook UIViewController

- (void)viewDidLoad {
    %orig;
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    menuButton.frame = CGRectMake(20, 100, 120, 40);
    [menuButton setTitle:@"Чит меню" forState:UIControlStateNormal];
    menuButton.backgroundColor = [UIColor redColor];
    [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    menuButton.layer.cornerRadius = 10;
    menuButton.tag = 999;
    [menuButton addTarget:self action:@selector(openCheatMenu) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if (window) [window addSubview:menuButton];
    });
}

%new
- (void)openCheatMenu {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"⚡ Чит меню"
                                                                   message:@"Выбери функцию"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Wallhack (ON/OFF)" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // код Wallhack
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Aimbot (ON/OFF)" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // код Aimbot
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Закрыть" style:UIAlertActionStyleCancel handler:nil]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

%end
