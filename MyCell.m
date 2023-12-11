//
//  MyCell.m
//  miniDemo
//
//  Created by gejingwen on 2023/11/22.
//

#import "MyCell.h"
#import "DataModel.h"


@interface MyCell()

@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelSubTitle;
@property (weak, nonatomic) IBOutlet UIButton *subButton;
@property (weak, nonatomic) UITextView *myText;


@property (weak, nonatomic) UILabel *myLable;

@property (weak, nonatomic) UIButton *myButton;
@property (nonatomic,weak) UILabel *secondLabel;


@end

@implementation MyCell

int count = 0;

- (void)setItem_index:(int)item_index{
   // self.item_index = item_index;
}

- (void)setTempData:(DataModel *)arr{

//    self.labelTitle.text = arr[0];
//    self.labelSubTitle.text = arr[1];
//  //  self.subButton.titleLabel.text = @"我的按钮";
//    [self.subButton setTitle:@"按下前" forState:UIControlStateNormal];
//    [self.subButton setTitle:@"按下后" forState:UIControlStateHighlighted];
//    [self.subButton addTarget:self action:@selector(myTouchDown) forControlEvents:UIControlEventTouchUpInside];
    
//    if(count < arr.count){
//        self.myLable.text = [arr[count] stringByAppendingFormat:@"我的标题行"];
//        NSLog(@"-------%d",count);
//        count++;
//        NSLog(@"。。。。。。%d",count);
//    }
    
//    self.myLable.text = [arr[count] stringByAppendingFormat:@"我的标题行"];
//    NSLog(@"-------%d",count);
//    count++;
//    NSLog(@"。。。。。。%d",count);
    
    
    self.myLable.text = arr.title;
    self.myTextView.text = arr.subtitle;
    self.secondLabel.text = @"暂无均价 轻食沙拉 望京";

  
    
}
 
- (void) myTouchDown{
    
    NSLog(@"按钮点击事件被调用了");
    [self.delegate touchDown];
}

//手动给cell添加内容——重写单元格的 initWithStyle 方法，通过xib方式创建单元格不会调用该方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //头像区域
        UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        self.myImage = myImage;
        [self.contentView addSubview:myImage];
        
        //标题区域
        UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 300,20)];
        mylabel.textColor = [UIColor darkTextColor];
     //   mylabel.text = @"标题行";
        self.myLable = mylabel;
        [self.contentView addSubview:mylabel];
        
        //副标题
        UILabel *secondlabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 300,30)];
        secondlabel.textColor = [UIColor lightGrayColor] ;
        secondlabel.font = [UIFont systemFontOfSize:12];
        self.secondLabel = secondlabel;
        [self.contentView addSubview:secondlabel];
        
        //内容区域
        UITextView *myTextView = [[UITextView alloc] init];
        myTextView.frame = CGRectMake(100, 55, 150, 30);
    //    myTextView.backgroundColor = [UIColor yellowColor];
        myTextView.textColor = [UIColor darkGrayColor];
    //    myTextView.text =@"这里是内容这里是内容这里是内容这里是内容这里是内容";
        self.myTextView = myTextView;
        [self.contentView addSubview:myTextView];
        
        //按钮
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        myButton.frame = CGRectMake(300, 60, 80, 30);
        myButton.layer.masksToBounds = YES;
        myButton.layer.cornerRadius = 5;
        myButton.backgroundColor = [UIColor systemYellowColor];
       
        [myButton setTitle:@"我的按钮" forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [myButton setTitle:@"按钮已经按下" forState:UIControlStateHighlighted];
        [myButton addTarget:self action:@selector(myTouchDown) forControlEvents:UIControlEventTouchUpInside];
        self.myButton = myButton;
        [self.contentView addSubview:myButton];
    }
    return self;
}

//设置data
- (void)settingData{
  //  self.myText.text = @"我的标题行";
    
}

//设置frame
- (void) settingFrame{
    self.myText.frame = CGRectMake(40, 100, 50, 20);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
