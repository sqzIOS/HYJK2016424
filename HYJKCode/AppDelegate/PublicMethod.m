//
//  PublicMethod.m
//  sexduoduo
//
//  Created by Showm on 14-7-21.
//  Copyright (c) 2014年 dbCode. All rights reserved.
//

#import "PublicMethod.h"
#import "TFHpple.h"
#import "RegexKitLite.h"
#import <CoreText/CoreText.h>

@implementation PublicMethod


//论坛相关 由html字符串获得img的src 数组
+(NSMutableArray *)getImgArrFromHtmlStr:(NSString *)string
{
    //抓取图片地址
    TFHpple *xpathparser=[[TFHpple alloc]initWithHTMLData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSArray *array1 = [xpathparser
                       searchWithXPathQuery:@"//img"];
    
    NSMutableArray *imageArr=[[NSMutableArray alloc]init];
    for (TFHppleElement *element in array1) {
        NSDictionary *attributesDic=[element attributes];
        NSString *url=[attributesDic objectForKey:@"src"];
        if (url) {
            [imageArr addObject:url];
        }
        
    }
    
    return imageArr;
}
//清除html标签
+ (NSString *)clearHtmlTag:(NSString *)text
{
    NSString *str = [NSString stringWithFormat:@"%@", text];
    NSString *regEx = @"<([^>]*)>";
    str = [str stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfRegex:regEx withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];//网页的空格占位符
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];//"
    return str;
}

// 距离凌晨24点的时间
+(int )timeDistance24
{
    int timeDictance=24*60*60;
    
    NSDateFormatter*date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *dateStr=[date  stringFromDate:dat];
    
    NSArray*array = [dateStr componentsSeparatedByString:@" "];
    
    NSArray * array2=[array[1] componentsSeparatedByString:@":"];
    NSLog(@"时间=%@ %@ %@ ",array2[0],array2[1],array2[2]);

    timeDictance = 24*60*60- [array2[0] intValue]*60*60 - [array2[1] intValue]*60 -[array2[2] intValue];
    return timeDictance;
}
// 化简时间  参数格式 yyyy-MM-dd HH:mm:ss
+ (NSString*)intervalSinceNow: (NSString*) theDate
{
    
    NSDateFormatter*date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate*d=[date dateFromString:theDate];
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString*timeString=@"";
    NSTimeInterval cha=now-late;
    //发表在一小时之内
    if(cha/3600<1) {
        if(cha/60<1) {
            timeString = @"1";
        }
        else
        {
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
        }
        
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }
    //在一小时以上24小以内
    else if(cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }
    //发表在24以上10天以内
    else if(cha/86400>1&&cha/864000<1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }
    //发表时间大于10天 显示几月-几号 eg：11-11
    else
    {
        //        timeString = [NSString stringWithFormat:@"%d-%"]
        NSArray*array = [theDate componentsSeparatedByString:@" "];
        //        return [array objectAtIndex:0];
        timeString = [array objectAtIndex:0];//年月日
//        timeString = [timeString substringWithRange:NSMakeRange(5, [timeString length]-5)];//月日
    }
    return timeString;
}





// 获得 头像 调用前userSex 和 本地头像要有更新
+(UIImage *)getHeaderImage
{
    UIImage *img=nil;
    if (!ISLOGIN) {//性多多首页
        img=UIImageByName(@"myCenter_userImg2.png");
    }else
    {
        NSData *data = [NSData dataWithContentsOfFile:UserHeadImageFileName];
        
        if (data) {
             img = [[UIImage alloc] initWithData:data];
        }else
        {
            
            if ([USERSEX isEqualToString:@"女"]) {
                img = UIImageByName(@"morentouxiangWoman.png");
            }else
            {
                img = UIImageByName(@"morentouxiangMan.png");
            }
        }
        
    }
    
    return img;
}

//保存图片到本地
+ (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];// and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    
}



//下载图片
+(UIImage *)downloadImageWithURL:(NSString *)urlStr
{
    UIImage *image=nil;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
       
        image =[UIImage imageWithData:response];
        //标题栏网络连接图标的显示和取消
//        [UIApplication sharedApplication].networkActivityIndicatorVisible=![UIApplication sharedApplication].networkActivityIndicatorVisible;
       
        return image;
    }else{
        return nil;
    }
}

+(int)getAttributedStringHeightWidthValue:(int)width  andAttributedString:(NSMutableAttributedString *)attributedString
{
    //    [self initAttributedString];
    
    int total_height = 0;
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);    //string 为要计算高度的NSAttributedString
    CGRect drawingRect = CGRectMake(0, 0, width, 100000);  //这里的高要设置足够大
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    int line_y = (int) origins[[linesArray count] -1].y;  //最后一行line的原点y坐标
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (__bridge CTLineRef)[linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 100000 - line_y + (int) descent +1;//+1为了纠正descent转换成int小数点后舍去的值
    
    CFRelease(textFrame);
    
    return total_height;
    
}


// 跳转登录
+(void)gotoLoginWithVC:(UIViewController *)vc
{
}

// 活动页面跳转商品 或者 分类页面
+(void)themeGotoSubViewWithThisVC:(UIViewController *)vc andDic:(NSDictionary *)dic
{
    
}

@end
