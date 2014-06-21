//
//  AskQuestionViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "AskQuestionViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "QuestionService.h"
#import "CommonService.h"
#import "TeacherListViewController.h"

#define SMALL_WIDTH                         150    //小图片宽度

@interface AskQuestionViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,TeacherListDelegate>
{
    UIImageView *_sendImage;
    NSString *_sendImageName;
    QuestionService *_quesService;
    CommonService *_commonService;
    NSString *_teacherID;
}

@property (nonatomic, retain) UIPopoverController *popover;

@end

@implementation AskQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initService
{
    _quesService = [[QuestionService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我要提问"];
    
    self.quesTitle.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.quesTitle.layer.borderWidth = 1;
    self.quesContent.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.quesContent.layer.borderWidth = 1;
    
    //判断指定教师按钮是否可用
    PERSONAL_ID personID = [_commonService currentPersonalID];
    if (personID == PERSONAL_VIP)
    {
        _selectTeacherBtn.enabled = YES;
    }
    else
    {
        _selectTeacherBtn.enabled = NO;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    float keyBoardViewWidth = [[UIScreen mainScreen] bounds].size.width;
    UIView *keyBoradTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, keyBoardViewWidth,30)];
    keyBoradTopView.backgroundColor = [UIColor lightGrayColor];
    
    //完成按钮
    UIButton *doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    doneBtn.frame = CGRectMake(keyBoardViewWidth-40, 2, 30, 26);
    [doneBtn setTitle:@"完成" forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    doneBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [doneBtn addTarget:self action:@selector(editDone) forControlEvents:UIControlEventTouchUpInside];
    [keyBoradTopView addSubview:doneBtn];
    
    [_quesContent setInputAccessoryView:keyBoradTopView];
}

-(void)keyboardWillShow:(NSNotification *)note
{
    if ([_quesContent isFirstResponder])
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame),-68+BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        }];
    }
}
- (void)keyboardWillHide:(NSNotification *)note
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame), BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }];
}

- (void)editDone
{
    [_quesContent resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectImg:(id)sender
{
    UIActionSheet *menu = [[UIActionSheet alloc]
                           initWithTitle: nil
                           delegate:self
                           cancelButtonTitle:@"取消"
                           destructiveButtonTitle:nil
                           otherButtonTitles:@"相册",
                           @"拍照", nil];
    [menu showInView:[UIApplication sharedApplication].keyWindow];

}

- (void)sendQuestion:(id)sender
{
    
    if (_quesTitle.text == nil || _quesTitle.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"标题不能为空" delegate:nil];
        return;
    }
    else if (_quesContent.text == nil || _quesContent.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"内容不能为空" delegate:nil];
        return;
    }

    NSData *imageData = nil;
    if (_sendImage.image != nil)
    {
        imageData = UIImageJPEGRepresentation(_sendImage.image, 0.5);
    }
    
    Question *ques = [[Question alloc] init];
    ques.questionTitle = _quesTitle.text;
    ques.questionContent = _quesContent.text;
    
    BOOL result = [_quesService askQuestionWithQuestion:ques FileData:imageData FileName:_sendImageName];
    if (result)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self showErrorInfoWithMessage:@"发布失败" delegate:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//#pragma mark UITextViewDelegate
//- (void)textViewDidChange:(UITextView *)textView
//{
//    //modify _sendImage frame
//    CGSize textSize = [_quesContent.text sizeWithFont:_quesContent.font constrainedToSize:CGSizeMake(CGRectGetWidth(_quesContent.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
//    _sendImage.frame = CGRectMake(10,textSize.height+30,
//                                  CGRectGetWidth(_sendImage.frame), CGRectGetHeight(_sendImage.frame));
//    //modify content frame
//    _quesContent.contentSize = CGSizeMake(_quesContent.contentSize.width,300);
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    //modify _blogText frame
//    _quesContent.contentSize = CGSizeMake(_quesContent.contentSize.width, _quesContent.contentSize.height + CGRectGetHeight(_sendImage.frame));
//}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        [self photoalbumr];//图库相册
        
    }else if(buttonIndex==1)
    {
        [self photocamera];//拍照
    }
}
//从相册获取
-(void)photoalbumr
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker =
        [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
    
}
//通过拍照获取
-(void)photocamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController* imagepicker = [[UIImagePickerController alloc] init];
        imagepicker.delegate = self;
        imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagepicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        UIViewController *viewCon = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        [viewCon presentViewController:imagepicker animated:YES completion:nil];
    }
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //判断选择的是否是图片
    if ([[info valueForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString*)kUTTypeImage])
    {
        UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
        
        //获取图片名称
        if ([info valueForKey:UIImagePickerControllerReferenceURL] != nil)
        {
            NSString * referenceURL = [NSString stringWithFormat:@"%@",
                                       [info valueForKey:UIImagePickerControllerReferenceURL]];
            NSString *imageName = nil;
            NSString *imageExtension = nil;
            NSArray *referenceArr = [referenceURL componentsSeparatedByString:@"&"];
            for (NSString * str in referenceArr)
            {
                NSRange range = [str rangeOfString:@"id"];
                if (range.length > 0)
                {
                    imageName = [str substringWithRange:NSMakeRange(range.location+range.length+1,
                                                                    str.length-
                                                                    (range.location+range.length+1))];
                }
                else
                {
                    range = [str rangeOfString:@"ext"];
                    if (range.length>0)
                    {
                        imageExtension = [str substringWithRange:
                                          NSMakeRange(range.location+range.length+1,
                                                      str.length-(range.location+range.length+1))];
                    }
                    
                }
            }
            _sendImageName = [imageName stringByAppendingPathExtension:imageExtension];
        }
        else
        {
            //没有获取到图片名，那么去当前时间作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyyMMddhhmmss"];
            NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.jpg",
                                   [formatter stringFromDate:[NSDate date]]];
            _sendImageName = imagePath;
            
        }
        _imgName.text = _sendImageName;
        if (_sendImage == nil)
        {
            UIImageView *sendImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                   _quesContent.frame.size.height-100,
                                                                                   100, 100)];
//            sendImage.userInteractionEnabled = YES;
//            UITapGestureRecognizer *imageTapGesture = [[UITapGestureRecognizer alloc]
//                                                       initWithTarget:self
//                                                       action:@selector(sendImageViewTap:)];
//            [sendImage addGestureRecognizer:imageTapGesture];
            _sendImage = sendImage;
        }
//
//        CGSize size = image.size;
//        if (image.size.width > SMALL_WIDTH)
//        {
//            size = CGSizeMake(SMALL_WIDTH, image.size.height*(SMALL_WIDTH/image.size.width));
//            
//        }
//        CGSize textSize = [_quesContent.text sizeWithFont:_quesContent.font constrainedToSize:CGSizeMake(CGRectGetWidth(_quesContent.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
//        _sendImage.frame = CGRectMake(10,textSize.height+30,
//                                      size.width, size.height);
        _sendImage.image = image;
//        [_quesContent addSubview:_sendImage];
//        _quesContent.contentSize = CGSizeMake(_quesContent.contentSize.width, _quesContent.contentSize.height + CGRectGetHeight(_sendImage.frame));
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

//图片到点击事件
-(void)sendImageViewTap:(UITapGestureRecognizer*)gesture
{
//    WblgShowImageViewController *showImgViewCon = [ViewUtil viewControllerFromNibOfClass:[WblgShowImageViewController class]];
//    showImgViewCon.delegate = self;
//    showImgViewCon.img = _sendImage.image;
//    [self.navigationController pushViewController:showImgViewCon animated:YES];
}

// 完成选取
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//删除图片
#pragma mark WblgShowImageDelegate
- (void)deleteSendImage
{
    _quesContent.contentSize = CGSizeMake(_quesContent.contentSize.width, _quesContent.contentSize.height - CGRectGetHeight(_sendImage.frame));
    [_sendImage removeFromSuperview];
    _sendImage = nil;
}

#pragma mark TeacherListDelegate
- (void)selectTeacherWithTeacherID:(NSString *)teacherID andTeacherName:(NSString *)teacherName
{
    _teacherID = teacherID;
    _teacherName.text = teacherName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SelectTeacherSegue"])
    {
        TeacherListViewController *teacherListVC = [segue destinationViewController];
        teacherListVC.selectTeacher = YES;
        teacherListVC.delegate = self;
    }
}

@end
