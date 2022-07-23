# 使用指南/售后流程/常见问题
## sql 变更

``` sql 
-- website 菜单
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1200','useGuide','ce9602186d2a7f65267c94a16499f123','useGuide','NONE','使用指南',2,2,NULL,'menu',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',0),
	 ('1201','commonQuestion','ce9602186d2a7f65267c94a16499f123','commonQuestion','NONE','常见问题',2,3,NULL,'menu',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',0),
	 ('1202','afterSalesProcess','ce9602186d2a7f65267c94a16499f123','afterSalesProcess','POST','售后流程',2,4,NULL,'menu',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',0),
	 ('1301','commonQuestionProductList','1201','/api/rest/website/external/question/product/resort/list','GET','常见问题类型列表',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1302','commonQuestionProductSort','1201','/api/rest/website/external/question/product/resort','POST','常见问题类型排序',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1303','commonQuestionProductAdd','1201','/api/rest/website/external/question/product/update','POST','常见问题类型添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1304','commonQuestionProducUpdate','1201','/api/rest/website/external/question/product/add','POST','常见问题类型更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1305','commonQuestionProductDelete','1201','/api/rest/website/external/question/product/delete','POST','常见问题类型删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1306','commonQuestionPageSelect','1201','/api/rest/website/external/question/page','GET','常见问题分页查询',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1307','commonQuestionAdd','1201','/api/rest/website/external/question/add','POST','常见问题添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1);
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1308','commonQuestionUpdate','1201','/api/rest/website/external/question/update','POST','常见问题更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1309','commonQuestionDelete','1201','/api/rest/website/external/question/batch/delete','POST','常见问题批量删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1310','commonQuestionDetailInfo','1201','/api/rest/website/external/question/detail/info','GET','常见问题详情',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1311','commonQuestionSortedList','1201','/api/rest/website/external/question/resort/list','GET','常见问题排序列表',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1312','commonQuestionResort','1201','/api/rest/website/external/question/resort','POST','常见问题重排序',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1313','commonQuestionRelease','1201','/api/rest/website/external/question/release','POST','常见问题发布或取消发布',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1314','searchWordPageSelect','1201','/api/rest/website/external/question/search/word/page','GET','热门搜索词分页查询',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:16',1),
	 ('1315','searchWordAdd','1201','/api/rest/website/external/question/search/word/add','POST','热门搜索词添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:19',1),
	 ('1316','searchWordUpdate','1201','/api/rest/website/external/question/search/word/update','POST','热门搜索词更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:22',1),
	 ('1317','searchWordDelete','1201','/api/rest/website/external/question/search/word/batch/delete','POST','热门搜索词批量删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:24',1);
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1319','searchWordSortedList','1201','/api/rest/website/external/question/search/word/resort/list','GET','热门搜索词排序列表',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:27',1),
	 ('1320','searchWordResort','1201','/api/rest/website/external/question/search/word/resort','POST','热门搜索词重排序',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:30',1),
	 ('1321','searchWordRelease','1201','/api/rest/website/external/question/search/word/release','POST','热门搜索词发布或取消发布',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-16 17:53:33',1),
	 ('1322','statisticPageRelease','1201','/api/rest/website/external/question/search/word/statistics/page','GET','统计搜索词分页查询',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1331','useGuideProductList','1200','/api/rest/website/external/guide/product/resort/list','GET','使用指南类型列表',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1332','useGuideProductSort','1200','/api/rest/website/external/guide/product/resort','POST','使用指南类型排序',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1333','useGuideProductAdd','1200','/api/rest/website/external/guide/product/update','POST','使用指南类型添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1334','useGuideProducUpdate','1200','/api/rest/website/external/guide/product/add','POST','使用指南类型更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1335','useGuideProductDelete','1200','/api/rest/website/external/guide/product/delete','POST','使用指南类型删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1336','useGuidePageSelect','1200','/api/rest/website/external/guide/page','GET','使用指南分页查询',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1);
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1337','useGuideAdd','1200','/api/rest/website/external/guide/add','POST','使用指南添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1338','useGuideUpdate','1200','/api/rest/website/external/guide/update','POST','使用指南更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1339','useGuideDelete','1200','/api/rest/website/external/guide/batch/delete','POST','使用指南批量删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1340','useGuideDetailInfo','1200','/api/rest/website/external/guide/detail/info','GET','使用指南详情',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1341','useGuideSortedList','1200','/api/rest/website/external/guide/resort/list','GET','使用指南排序列表',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1342','useGuideResort','1200','/api/rest/website/external/guide/resort','POST','使用指南重排序',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1343','useGuideRelease','1200','/api/rest/website/external/guide/release','POST','使用指南发布或取消发布',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-03-14 16:59:23',1),
	 ('1350','afterSalesProcessPageSelect','1202','/api/rest/website/external/sales/page','GET','售后流程分页查询',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:45',1),
	 ('1351','afterSalesProcessAdd','1202','/api/rest/website/external/sales/add','POST','售后流程添加',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:46',1),
	 ('1352','afterSalesProcessUpdate','1202','/api/rest/website/external/sales/update','POST','售后流程更新',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:46',1);
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1353','afterSalesProcessDelete','1202','/api/rest/website/external/sales/batch/delete','POST','售后流程批量删除',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:46',1),
	 ('1354','afterSalesProcessDetailInfo','1202','/api/rest/website/external/sales/detail/info','GET','售后流程详情',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:46',1),
	 ('1355','afterSalesProcessRelease','1202','/api/rest/website/external/sales/release','POST','售后流程发布或取消发布',3,NULL,NULL,'button',NULL,0,'2022-03-14 16:59:23','2022-04-14 10:08:46',1);

-- website.t_website definition

CREATE TABLE `t_website` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题名',
  `product_id` varchar(32) DEFAULT NULL COMMENT '所属类型id',
  `product_name` varchar(255) DEFAULT NULL COMMENT '所属类型名字',
  `module_name` varchar(100) NOT NULL COMMENT '归属模块',
  `release_status` tinyint(4) NOT NULL COMMENT '发布状态，1-未发布，4-已发布',
  `sort_no` int(11) NOT NULL COMMENT '排序状态',
  `text_id` varchar(32) NOT NULL COMMENT '富文本id',
  `creator` varchar(32) NOT NULL COMMENT '创建者',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_deleted_sort` (`product_id`,`deleted`,`sort_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网基本信息表';


-- website.t_website_hot_word definition

CREATE TABLE `t_website_hot_word` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `sort_no` int(11) NOT NULL COMMENT '排序',
  `search_word` varchar(255) NOT NULL COMMENT '热门搜索词',
  `release_status` tinyint(4) NOT NULL COMMENT '0-未发布，1-已发布',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `creator` varchar(32) NOT NULL COMMENT '创建者',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_search_word` (`search_word`(40)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网热门搜索词表';


-- website.t_website_product definition

CREATE TABLE `t_website_product` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `product_name` varchar(255) NOT NULL COMMENT '产品名字',
  `sort_no` int(11) NOT NULL COMMENT '产品排序',
  `module_name` varchar(50) NOT NULL COMMENT '归属模块',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_module` (`product_name`(50),`module_name`) USING BTREE,
  KEY `idx_module_deleted_sort` (`module_name`,`deleted`,`sort_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网文本内容类别表';


-- website.t_website_text definition

CREATE TABLE `t_website_text` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `content` text NOT NULL COMMENT '文本内容',
  `resource_list` mediumtext COMMENT '附件列表',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网文本内容表';


-- website.t_website_word_statistics definition

CREATE TABLE `t_website_word_statistics` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `search_word` varchar(255) NOT NULL COMMENT '产品名字',
  `search_count` int(11) NOT NULL COMMENT '次数',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`search_count`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网搜索词统计表';
```
---

# 新闻中心
## SQL变更

``` sql
INSERT INTO website.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,create_time,update_time,authorize_type) VALUES
	 ('1500','newsManagement','0','newsManagement','NONE','新闻中心',1,4,NULL,'menu',NULL,0,'2022-04-25 11:12:12','2022-04-25 11:12:12',0),
	 ('1600','companyNews','1500','companyNews','NONE','公司新闻',1,1,NULL,'menu',NULL,0,'2022-04-28 15:47:27','2022-07-06 14:37:01',0),
	 ('1601','newsManagementAntPrefix','1600','/api/rest/website/external/news/**','GET','新闻中心ant请求前缀',2,1,NULL,'button',NULL,0,'2022-04-25 11:12:12','2022-07-06 14:36:38',1),
	 ('1700','websiteHomePage','0','websiteHomePage','NONE','官网首页',1,5,NULL,'menu',NULL,0,'2022-07-06 14:27:37','2022-07-06 14:35:22',0),
	 ('1701','homePageNews','1700','homePageNews','NONE','首页新闻',1,1,NULL,'menu',NULL,0,'2022-07-06 14:30:36','2022-07-06 14:37:02',0);

-- website.t_website_news definition
CREATE TABLE `t_website_news` (
  `id` varchar(32) NOT NULL COMMENT '新闻主键',
  `news_title` varchar(100) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `news_summary` varchar(255) NOT NULL COMMENT '新闻摘要',
  `news_cover` varchar(255) NOT NULL COMMENT '新闻封面',
  `news_author` varchar(255) DEFAULT NULL COMMENT '作者信息',
  `release_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `home_page_display` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '首页展示，0-不展示，1-展示',
  `text_id` varchar(32) NOT NULL COMMENT 'text富文本内容id',
  `creator` varchar(32) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_releaseStatus_deleted_releaseTime` (`release_status`,`deleted`,`release_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='官网新闻基本信息表';
```

## SE升级
``` yaml
jasypt:
  encryptor:
    algorithm: {{db.db_auxiliary.algorithm}}
    password: {{db.db_auxiliary.salt}}

spring:
  mvc:
    pathmatch:
      matching-strategy: ANT_PATH_MATCHER
  main:
    allow-circular-references: true
spring:
  datasource:
    dynamic:
      datasource:
        primary:
          jdbc-url: jdbc:mysql://{{db.db_auxiliary.url}}/website?serverTimezone=GMT%2B8&useSSL=false&zeroDateTimeBehavior=convertToNull&socketTimeout=60000&autoReconnect=true&maxReconnects=15&useUnicode=true&characterEncoding=utf8
```

