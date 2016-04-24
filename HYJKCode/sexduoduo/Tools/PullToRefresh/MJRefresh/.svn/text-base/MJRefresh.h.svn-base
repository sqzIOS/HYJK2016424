// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "UIScrollView+MJRefresh.h"

/**
 MJ友情提示：
 1. 添加头部控件的方法
 [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
 或者
 [self.tableView addHeaderWithCallback:^{ }];
 
 2. 添加尾部控件的方法
 [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
 或者
 [self.tableView addFooterWithCallback:^{ }];
 
 3. 可以在MJRefreshConst.h和MJRefreshConst.m文件中自定义显示的文字内容和文字颜色
 
 4. 本框架兼容iOS6\iOS7，iPhone\iPad横竖屏
 
 5.自动进入刷新状态
 1> [self.tableView headerBeginRefreshing];
 2> [self.tableView footerBeginRefreshing];
 
 6.结束刷新
 1> [self.tableView headerEndRefreshing];
 2> [self.tableView footerEndRefreshing];
 
 
 eg:
 // 1.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
 [self.classifyTableV addHeaderWithTarget:self action:@selector(headerRereshing)];
 
 // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
 
 self.classifyTableV.headerPullToRefreshText = @"查看上个商品分类";
 self.classifyTableV.headerReleaseToRefreshText = @"查看上个商品分类";
 self.classifyTableV.headerRefreshingText = @"查看上个商品分类";
 
 
 // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
 [self.classifyTableV addFooterWithTarget:self action:@selector(footerRereshing)];
 
 // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
 
 self.classifyTableV.footerPullToRefreshText = @"查看下个商品分类";
 self.classifyTableV.footerReleaseToRefreshText = @"查看下个商品分类";
 self.classifyTableV.footerRefreshingText = @"查看下个商品分类";
 
 self.classifyTableV.isFenLei=YES;
 
 
 
*/