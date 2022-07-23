===================================== 水印添加 =====================================
-- SQL上线 ： 配置表 + 新增接口
CREATE TABLE `t_sys_config` (
  `id` varchar(32) NOT NULL COMMENT '自增 id',
  `config_name` varchar(100) NOT NULL COMMENT '配置名',
  `config_value` varchar(100) NOT NULL COMMENT '配置值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unk_config_name` (`config_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO sdkdeveloper.t_sys_menu 
(id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,authorize_type) 
VALUES
('xxxxb4017c676d4dfb4d5880742f1019','exportUnreleasedDoc','tf64b4017c676d4dfb4d5880742f1002','/api/rest/developer/external/document/export/unreleased/doc','GET','pdf导出一篇未发布的文档',3,NULL,NULL,'button',NULL,1),
('xxxxb4017c676d4dfb4d5880742f1020','exportSceneDocs','tf64b4017c676d4dfb4d5880742f1002','/api/rest/developer/external/document/export/scene/docs','GET','pdf导出场景下所有发布的文档',3,NULL,NULL,'button',NULL,1),
('xxxxb4017c676d4dfb4d5880742f1021','checkExportSceneDocs','tf64b4017c676d4dfb4d5880742f1002','/api/rest/developer/external/document/check','GET','异步检查导出',3,NULL,NULL,'button',NULL,1),
('xxxxb4017c676d4dfb4d5880742f1022','finalExportDocs','tf64b4017c676d4dfb4d5880742f1002','/api/rest/developer/external/document/file','GET','异步检查导出',3,NULL,NULL,'button',NULL,1)

('oooo57929b1ebbe41c7222f2c1b5gg00','ConfigManagement','0','ConfigManagement','NONE','配置管理',1,3,NULL,'menu',NULL,0),
('oooo57929b1ebbe41c7222f2c1b50001','WatermarkConfigManagement','oooo57929b1ebbe41c7222f2c1b5gg00','WatermarkConfigManagement','NONE','水印配置',2,1,NULL,'menu',NULL,0),
('oooo57929b1ebbe41c7222f2c1b50002','getConfig','oooo57929b1ebbe41c7222f2c1b5gg00','/api/rest/developer/external/sys/config','POST','查询配置',3,1,NULL,'button',NULL,2),
('oooo57929b1ebbe41c7222f2c1b50003','updateConfig','oooo57929b1ebbe41c7222f2c1b5gg00','/api/rest/developer/external/sys/config/update','POST','更新配置',3,1,NULL,'button',NULL,2);

-- 进度
    同步删除文件

-- 问题

-- 新需求
    是否异步，异步操作
    菜单名称改为导出水印配置

-- Bug



===================================== 用户反馈增强 =====================================
-- SQL上线 ： 新增字段 + 新增接口
ALTER TABLE sdkdeveloper.t_content_feedback ADD customer_name varchar(100) NULL COMMENT '客户名称';
ALTER TABLE sdkdeveloper.t_content_feedback ADD processing_status varchar(100) DEFAULT 0 NOT NULL;
ALTER TABLE sdkdeveloper.t_content_feedback ADD platform_name varchar(100) DEFAULT '' NOT NULL COMMENT '平台名称';
ALTER TABLE sdkdeveloper.t_content_feedback ADD deleted TINYINT(4) DEFAULT 0 NOT NULL;

INSERT INTO sdkdeveloper.t_sys_menu
(id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,authorize_type) 
VALUES
('qqqq4017c676d4dfb4d5880742f0004','getFeedbackDetailInfo','qqqq4017c676d4dfb4d5880742f0001','/api/rest/developer/external/feedback/detail/info','GET','反馈信息详情',3,NULL,NULL,'button',NULL,1),
('qqqq4017c676d4dfb4d5880742f0005','markFeedback','qqqq4017c676d4dfb4d5880742f0001','/api/rest/developer/external/feedback/mark','POST','反馈信息详情',3,NULL,NULL,'button',NULL,1);

===================================== Hotfix =====================================
-- 需求
 fileMange上需要添加 sdk-developer-cover storeType 

===================================== SE升级 =====================================
-- config修改
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