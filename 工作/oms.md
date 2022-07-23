# 个人云会议室迁移

## 梳理逻辑
<pre>
云会议室配置
    smartMutePerson         （智能静音，取值：true|false）
    chiefDeviceId           （主设备ID，取值：true|false）
    presenterPassword       （演示者密码，取值：true|false）
    autoRecord              （自动录制，取值：true|false）
    autoHangup              （自动挂断，取值：true|false）
    allowAnswer             （答题器）
    subtitle                （同传字幕显示，取值：true|false）
    meetingMode             （远真模式，取值：0-正常|1-远真）       --   特殊
    enableDirect            （导播功能，取值：true|false）

云会议室可见性配置[控制终端是否显示该配置项]
    transcription                   （会议纪要，取值：true|false）
    subtitle                        （同传字幕显示，取值：true|false）
    multipleRecord                  （多路录制，取值：true|false）
    allowSeparateRecord             （允许终端单独录制，取值：true|false）
    separateRecordAudio             （参会终端声音单独录制，取值：true|false）
    forceRecord                     （强制录制，取值：true|false）
    enableHrLive                    （1080P超高清直播，取值：true|false）
    renewal                         （云会议室续费白名单）
    translate                       （同声传译：true/false）
    hideWatermark                   （暗水印开关：true/false）
    showTranscriptionInMeeting      （入会开启会议纪要：true/false）
</pre>

## SQL变更
``` sql
INSERT INTO oms.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,gmt_create,gmt_modified) VALUES
	 (1539138785910980609,'personConferenceManage',17,'/api/rest/oms/external/conference/config/manage','GET','个人云会议室配置',1,18,NULL,'menu',NULL,0,'2022-06-21 14:50:57','2022-06-21 16:25:20'),
	 (1539138785952923649,'',1539138785910980609,'/api/rest/oms/external/conference/config/manage/**',NULL,'个人云会议室配置-按钮',NULL,NULL,NULL,'button',NULL,0,'2022-06-21 14:50:57','2022-06-21 14:50:57');


INSERT INTO oms.oms_t_config (id,setting_type,config_name,config_key,config_value,default_value,config_type,config_desc,rules,dependencies,portals,parent_id,operate_type,deleted,gmt_create,gmt_modified,required,server_name,parameter_type) VALUES
	 (2455444820502773030,'conference_display_config','会议纪要','transcription','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773032,'conference_display_config','配置值','transcription_value','','false','switch','','','','["transcription"]','2455444820502773030',0,0,'2022-06-23 17:15:00','2022-07-04 15:55:24',1,'oms',0),
	 (2455444820502773033,'conference_display_config','同传字幕显示','subtitle','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773035,'conference_display_config','配置值','subtitle_value','','false','switch','','','','["subtitle"]','2455444820502773033',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773036,'conference_display_config','多路录制','multipleRecord','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773038,'conference_display_config','配置值','multipleRecord_value','','false','switch','','','','["multipleRecord"]','2455444820502773036',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773040,'conference_display_config','参会终端声音单独录制','separateRecordAudio','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773042,'conference_display_config','配置值','separateRecordAudio_value','','false','switch','','','','["separateRecordAudio"]','2455444820502773040',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773043,'conference_display_config','强制录制','forceRecord','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773045,'conference_display_config','配置值','forceRecord_value','','false','switch','','','','["forceRecord"]','2455444820502773043',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0);
INSERT INTO oms.oms_t_config (id,setting_type,config_name,config_key,config_value,default_value,config_type,config_desc,rules,dependencies,portals,parent_id,operate_type,deleted,gmt_create,gmt_modified,required,server_name,parameter_type) VALUES
	 (2455444820502773046,'conference_display_config','1080P超高清直播','enableHrLive','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773048,'conference_display_config','配置值','enableHrLive_value','','false','switch','','','','["enableHrLive"]','2455444820502773046',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773050,'conference_display_config','云会议室续费白名单','renewal','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773052,'conference_display_config','配置值','renewal_value','','false','switch','','','','["renewal"]','2455444820502773050',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773053,'conference_display_config','中文解释','translate','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773055,'conference_display_config','配置值','translate_value','','false','switch','','','','["translate"]','2455444820502773053',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773056,'conference_display_config','暗水印开关','hideWatermark','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773058,'conference_display_config','配置值','hideWatermark_value','','false','switch','','','','["hideWatermark"]','2455444820502773056',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773150,'conference_display_config','允许终端单独录制','allowSeparateRecord','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773152,'conference_display_config','配置值','allowSeparateRecord_value','','false','switch','','','','["allowSeparateRecord"]','2455444820502773150',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0);
INSERT INTO oms.oms_t_config (id,setting_type,config_name,config_key,config_value,default_value,config_type,config_desc,rules,dependencies,portals,parent_id,operate_type,deleted,gmt_create,gmt_modified,required,server_name,parameter_type) VALUES
	 (2455444820502773000,'conference_operate_config','智能静音人数','smartMutePerson','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-27 14:20:41',1,'oms',0),
	 (2455444820502773002,'conference_operate_config','配置值','smartMutePerson_value','','6','inputNumber','','[{"pattern":"^\\\\d+$","message":"请输入非负整数"}]','','["smartMutePerson"]','2455444820502773000',0,0,'2022-06-23 17:15:00','2022-06-27 14:26:03',1,'oms',0),
	 (2455444820502773010,'conference_operate_config','自动录制','autoReord','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773012,'conference_operate_config','配置值','autoReord_value','','false','switch','','','','["autoReord"]','2455444820502773010',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773013,'conference_operate_config','自动挂起','autoHangup','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773015,'conference_operate_config','配置值','autoHangup_value','','false','switch','','','','["autoHangup"]','2455444820502773013',0,0,'2022-06-23 17:15:00','2022-06-27 11:57:09',1,'oms',0),
	 (2455444820502773016,'conference_operate_config','答题器','allowAnswer','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773018,'conference_operate_config','配置值','allowAnswer_value','','false','switch','','','','["allowAnswer"]','2455444820502773016',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773020,'conference_operate_config','会议纪要','transcription','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773022,'conference_operate_config','配置值','transcription_value','','false','switch','','','','["transcription"]','2455444820502773020',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0);
INSERT INTO oms.oms_t_config (id,setting_type,config_name,config_key,config_value,default_value,config_type,config_desc,rules,dependencies,portals,parent_id,operate_type,deleted,gmt_create,gmt_modified,required,server_name,parameter_type) VALUES
	 (2455444820502773023,'conference_operate_config','同传字幕显示','subtitle','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773025,'conference_operate_config','配置值','subtitle_value','','false','switch','','','','["subtitle"]','2455444820502773023',0,0,'2022-06-23 17:15:00','2022-06-23 17:15:00',1,'oms',0),
	 (2455444820502773026,'conference_operate_config','远真模式','meetingMode','','','','','','','',NULL,0,0,'2022-06-23 17:15:00','2022-07-04 17:40:36',1,'oms',0),
	 (2455444820502773028,'conference_operate_config','配置值','meetingMode_value','{"0":"关闭","1":"开启"}','0','select','','','','["meetingMode"]','2455444820502773026',0,0,'2022-06-23 17:15:00','2022-07-06 16:01:22',1,'oms',0),
	 (2455444820502773029,'conference_operate_config','远真通道数量','channelCount','','0','inputNumber','','[{"pattern":"^\\\\d+$","message":"请输入非负整数"}]','[{"key": "meetingMode_value","value": "0"}]','','2455444820502773026',0,0,'2022-06-23 17:15:00','2022-07-04 18:45:41',1,'oms',0);

-- 菜单：是否需要修改
INSERT INTO oms.t_sys_menu (id,resource_key,parent_id,url,request_type,title,`level`,sort_no,icon,`type`,remarks,deleted,gmt_create,gmt_modified) VALUES
	 (1523596353794473986,'SDKChargeConfig',17,'/api/rest/oms/external/sdk/chargeConfig',NULL,'SDK计费配置',1,14,NULL,'menu',NULL,0,'2022-05-09 17:30:52','2022-05-09 17:48:09'),
	 (1523596353807056897,'',1523596353794473986,'/api/rest/oms/external/sdk/chargeConfig/**',NULL,'SDK计费配置-按钮',NULL,NULL,NULL,'button',NULL,0,'2022-05-09 17:30:52','2022-05-09 17:30:52'),
	 (1528568659889356801,'',1523596353794473986,'/api/rest/oms/external/winSdk/4k8k/**',NULL,'4k8k充值-按钮',NULL,NULL,NULL,'button',NULL,0,'2022-05-23 10:49:02','2022-07-11 14:07:12'),
	 (1539180121783533569,'',1523596353794473986,'/api/rest/oms/external/audio/push/stream/**',NULL,'音视频推流计费-按钮',NULL,NULL,NULL,'button',NULL,0,'2022-06-21 17:35:12','2022-07-11 14:07:12');
```
#  音视频推流计费  

#  Win SDK支持4K 8K 

#  HotFix 

## sql变更
``` sql
-- 隐私政策Bug
ALTER TABLE oms.t_policies_agreements MODIFY COLUMN `type` tinyint(4) NULL COMMENT '类型，0-隐私政策，1-服务协议';
ALTER TABLE oms.t_policies_agreements MODIFY COLUMN status tinyint(4) NOT NULL COMMENT '发布状态，0-待发布，1-已发布，2-已下架';
```