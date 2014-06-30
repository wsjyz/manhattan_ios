//
//  AnswerHomeWorkViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "AnswerHomeWorkViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "HomeworkService.h"
#import "CommonService.h"

#define SMALL_WIDTH                         150    //小图片宽度

@interface AnswerHomeWorkViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    __weak IBOutlet UITextView *_quesTextView;
    __weak IBOutlet BaseTextView *_answerTextView;
    __weak IBOutlet UIButton *_passImgBtn;
    __weak IBOutlet UILabel *_imgNameLabel;
    __weak IBOutlet UIButton *_submitBtn;
    UIImage *_sendImage;
    NSString *_sendImageName;
    
    HomeworkService *_homeworkService;
    CommonService *_commonService;
}

@end

@implementation AnswerHomeWorkViewController

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
    _homeworkService = [[HomeworkService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的作业"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _quesTextView.text = _homework.homeworkTitle;
}

-(void)keyboardWillShow:(NSNotification *)note
{
    if ([_answerTextView isFirstResponder])
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame),-140+BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
        }];
    }
}
- (void)keyboardWillHide:(NSNotification *)note
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame), BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submitHomework:(id)sender
{
    
    if (_answerTextView.text == nil || _answerTextView.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"内容不能为空" delegate:nil];
        return;
    }
    
    NSData *imageData = nil;
    if (_sendImage != nil)
    {
        imageData = UIImageJPEGRepresentation(_sendImage, 0.5);
    }
    
    HomeworkSubmit *homeworkSubmit = [[HomeworkSubmit alloc] init];
    homeworkSubmit.userId = [_commonService getCurrentUserID];
    homeworkSubmit.homeworkId = _homework.homeworkId;
    homeworkSubmit.homeworkContent = _answerTextView.text;
    homeworkSubmit.submitTime = [NSDate date];
    
    HomeworkSubmit *newHomework = [_homeworkService submitHomeWork:homeworkSubmit FileData:imageData FileName:_sendImageName];
    if (newHomework)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self showErrorInfoWithMessage:@"提交失败" delegate:nil];
    }
}

- (void)selectPic:(id)sender
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
        _imgNameLabel.text = _sendImageName;
        _sendImage = image;
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

// 完成选取
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
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

@end
