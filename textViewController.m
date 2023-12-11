//
//  textViewController.m
//  miniDemo
//
//  Created by gejingwen on 2023/12/10.
//

#import "textViewController.h"

@interface textViewController ()

@property (nonatomic,weak) UIImageView *image;

@end

@implementation textViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.image = myImage;
    self.image.image = [UIImage imageNamed:@"06.png"];
    [self.view addSubview:myImage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
