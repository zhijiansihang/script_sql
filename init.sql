CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL COMMENT 'app名称',
  `platform` varchar(255) NOT NULL COMMENT '系统平台,ios,android',
  `version_code` int(11) NOT NULL COMMENT '版本编码，整数',
  `version_name` varchar(255) NOT NULL COMMENT '版本号，如1.0.1',
  `min_version_code` int(11) DEFAULT NULL COMMENT '最低兼容版本编码，整数',
  `update_title` varchar(255) DEFAULT NULL COMMENT '更新提示标题',
  `update_content` varchar(255) DEFAULT NULL COMMENT '更新提示内容',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_status` varchar(255) DEFAULT NULL COMMENT '更新状态，1可用，-1不可用，提审状态',
  `update_url` varchar(255) DEFAULT NULL COMMENT '更新包下载地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE `cms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_code` smallint(5) unsigned NOT NULL COMMENT 'cms 描述:type_code:type_name = [banner:100:banner,[notice:200:公告,[information:300:资讯,[avatar:400:头像,[exam:500:考题\n',
  `type_name` varchar(128) DEFAULT NULL COMMENT 'cms 描述:type_code:type_name = [banner:100:banner,[notice:200:公告,[information:300:资讯,[avatar:400:头像,[exam:500:考题\n',
  `image_path` varchar(128) DEFAULT NULL COMMENT '文件系统图片路径',
  `image_access_path` varchar(128) DEFAULT NULL COMMENT '前台图片的链接',
  `title` varchar(2048) DEFAULT NULL COMMENT '标题',
  `sub_title` varchar(2048) DEFAULT NULL COMMENT '副标题',
  `content` varchar(2048) DEFAULT NULL COMMENT '内容',
  `href_link` varchar(256) DEFAULT NULL COMMENT '跳转链接',
  `is_front_display` tinyint(8) unsigned DEFAULT '0' COMMENT '是否前端显示 1:为显示 0:不显示',
  `is_deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否逻辑删除 1:删除 0:未删除',
  `location_size` int(10) unsigned DEFAULT '0' COMMENT '置顶功能,值越大，显示越靠前',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) unsigned NOT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) unsigned DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='内容管理表';

CREATE TABLE `loan` (
  `loan_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标id',
  `institution_user_id` bigint(20) NOT NULL COMMENT '所属机构id即userid',
  `title` varchar(128) NOT NULL COMMENT '产品名称',
  `loan_type` tinyint(3) unsigned NOT NULL COMMENT '1:公墓，2私募',
  `product_type` smallint(5) unsigned NOT NULL COMMENT '产品类型:1.信托；2.资管；3.其他资产, 4私募',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '投资规模',
  `interest_rate` decimal(10,2) DEFAULT NULL COMMENT '公墓利率',
  `is_rate_floating` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '公墓是否浮动 1位浮动 0 不浮动',
  `reserve_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已预约金额',
  `loan_status` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '机构操作：100 初始化审核中150 待发布 200募集中 300 结束 400 已删除',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否前台显示 1位显示 0 不显示',
  `location_size` int(10) unsigned DEFAULT '0' COMMENT '置顶功能,值越大，显示越靠前',
  `product_direction` varchar(128) NOT NULL COMMENT '产品方向（投资方向）产品方向：1.工商企业；2.金融市场；3.基础设施；4.房地产；5.资金池；6.其他；',
  `safeguard_way` varchar(512) DEFAULT NULL COMMENT '保障方式',
  `begin_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '起投金额',
  `earning_desc` varchar(1024) DEFAULT NULL COMMENT '收益描述',
  `issuer` varchar(128) DEFAULT NULL COMMENT '发行机构',
  `fund_type` smallint(5) unsigned DEFAULT NULL COMMENT '基金类型:1.本土；2.合资；3.外资；4.其他；',
  `servicing_way` smallint(5) unsigned DEFAULT NULL COMMENT '付息方式:1.按月付息；2.按季付息；3.半年付息；4.按年付息；5.到期付息；6.其他',
  `adaptation_deadline` varchar(128) DEFAULT NULL COMMENT '续存期限（年）',
  `investment_deadline` smallint(5) unsigned DEFAULT NULL COMMENT '投资期限（月）',
  `distribution_region` varchar(128) DEFAULT NULL COMMENT '发行地区',
  `ratio_type` smallint(5) unsigned DEFAULT NULL COMMENT '大小配比:1.小额畅打；2.已配出小额；3.严格配比；4.全大额',
  `bright_spot` varchar(128) NOT NULL COMMENT '产品卖点（产品亮点）',
  `finance_introduce` varchar(128) DEFAULT NULL COMMENT '融资方介绍',
  `money_use` varchar(128) DEFAULT NULL COMMENT '资金用途',
  `repay_source` varchar(128) DEFAULT NULL COMMENT '还款来源',
  `risk_control` varchar(128) DEFAULT NULL COMMENT '风险控制',
  `product_desc` varchar(128) DEFAULT NULL COMMENT '项目说明',
  `product_desc_files` varchar(1024) DEFAULT NULL COMMENT '项目文件名称列表json',
  `risk_alert` varchar(128) DEFAULT NULL COMMENT '风险提示',
  `capital_type` varchar(128) DEFAULT NULL COMMENT '资本类型',
  `organize_form` varchar(128) DEFAULT NULL COMMENT '组织形式',
  `manage_rate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '管理费率',
  `review_code` varchar(128) DEFAULT NULL COMMENT '审核结果',
  `review_desc` varchar(128) DEFAULT NULL COMMENT '审核描述',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `release_time` datetime DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `loan_finance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `loan_id` bigint(20) unsigned NOT NULL COMMENT '标id',
  `finance_user_id` bigint(20) unsigned NOT NULL COMMENT '理财师用户id',
  `is_deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '是否逻辑删除 1:删除 0:未删除',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loanid_financeuserid_UNIQUE` (`loan_id`,`finance_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品理财师关系表';

CREATE TABLE `loan_investor_finance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `loan_id` bigint(20) unsigned NOT NULL COMMENT '标id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '预约用户id',
  `real_name` varchar(256) DEFAULT NULL COMMENT '用户姓名',
  `mobile` varchar(256) DEFAULT NULL COMMENT '用户手机号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预约金额',
  `finance_user_id` bigint(20) unsigned NOT NULL COMMENT '预约人使用的理财师用户id',
  `is_deal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '理财师是否处理 1:已处理 0:处理中',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loanid_userid_UNIQUE` (`loan_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通过理财师预约产品表';

CREATE TABLE `sms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `req_message` varchar(1024) DEFAULT NULL COMMENT '发送的模板id,发送的模板参数或者内容',
  `resp_message` varchar(512) DEFAULT NULL COMMENT '第三方返回的消息(主要为失败原因)',
  `channel_name` varchar(64) DEFAULT NULL COMMENT '渠道名称',
  `template_code` varchar(64) DEFAULT NULL COMMENT '发送的类型:0001:注册验证码,或者为模板id',
  `request_id` varchar(64) DEFAULT NULL COMMENT '请求流水号',
  `biz_id` varchar(64) DEFAULT NULL COMMENT '第三方业务号',
  `send_status` tinyint(3) unsigned DEFAULT NULL COMMENT '发送状态,0:平台已经发送至第三方,1:第三方返回成功,2:第三方返回失败',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送表';

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `log_module` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `log_type` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `oper_time` datetime DEFAULT NULL,
  `remarks` varchar(600) COLLATE utf8_bin DEFAULT NULL,
  `user_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_resource` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `create_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `disp_order` int(11) DEFAULT NULL,
  `mod_type` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `res_level` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `res_type` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `style` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `update_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `disp_order` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `role_code` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `update_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bqy406dtsr7j7d6fawi1ckyn1` (`name`),
  UNIQUE KEY `UK_jqdita2l45v2gglry7bp8kl1f` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_role_resource` (
  `resourceid` varchar(40) COLLATE utf8_bin NOT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`roleid`,`resourceid`),
  KEY `FKlquxtncq97x72r3dsbvlrpd4i` (`resourceid`),
  CONSTRAINT `FKicubjaqbf5l8rqsdnrnkcc3xq` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKlquxtncq97x72r3dsbvlrpd4i` FOREIGN KEY (`resourceid`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `portrait_path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `real_name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `remarks` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `update_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_user_auth` (
  `auth_id` varchar(40) COLLATE utf8_bin NOT NULL,
  `auth_pass` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `auth_type` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `login_count` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `pass_time` datetime DEFAULT NULL,
  `update_by` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`auth_id`),
  KEY `FKcyn1ae48vclwpbxplt9h42nh0` (`user_id`),
  CONSTRAINT `FKcyn1ae48vclwpbxplt9h42nh0` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `sys_user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FKo4jryuw2ef7sb3vedhdwddp9x` (`roleid`),
  CONSTRAINT `FKo4jryuw2ef7sb3vedhdwddp9x` FOREIGN KEY (`roleid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FKp53n1gguvrlo0fy8y0f7o7cx9` FOREIGN KEY (`userid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE `user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机号',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `nick_name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `passwd` varchar(64) NOT NULL COMMENT '登录密码',
  `is_name_auth` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否实名认证 1:为已认证 0:未认证',
  `is_frozen` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否冻结 1:为冻结 0:未冻结',
  `is_register_jg` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否极注册 1:为注册 0:未注册',
  `logo` varchar(64) DEFAULT NULL,
  `roles` smallint(5) unsigned NOT NULL COMMENT '用户角色:1平台管理员 2:第三方机构 3:用户投资人 4:理财师 ',
  `source` smallint(5) unsigned NOT NULL COMMENT '注册来源:1平台后台创建 2:ios 3:安卓',
  `institution_user_id` bigint(20) DEFAULT NULL COMMENT '所属机构id即父userid',
  `institution_name` varchar(128) DEFAULT NULL COMMENT '所属机构id即父userid',
  `risk_assessment_level` smallint(5) unsigned DEFAULT NULL COMMENT '风险测评等级冗余',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `nick_name_UNIQUE` (`nick_name`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  UNIQUE KEY `realname_idcard_UNIQUE` (`real_name`,`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `user_auth_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'userid',
  `real_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(32) DEFAULT NULL COMMENT '身份证',
  `req_message` varchar(1024) DEFAULT NULL COMMENT '第三方请求参数',
  `resp_message` varchar(512) DEFAULT NULL COMMENT '第三方返回的消息',
  `request_id` varchar(64) DEFAULT NULL COMMENT '请求流水号',
  `biz_id` varchar(64) DEFAULT NULL COMMENT '第三方业务号',
  `send_status` tinyint(3) unsigned DEFAULT NULL COMMENT '发送状态,0:平台已经发送至第三方,1:第三方返回成功,2:第三方返回失败',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实名认证记录表';

CREATE TABLE `user_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'user_id',
  `content_id` bigint(20) unsigned NOT NULL COMMENT '内容id:理财师就是userid，产品就是loanid',
  `content_type` tinyint(3) unsigned NOT NULL COMMENT '收藏的类型 1:理财师(店铺) 2:产品',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';

CREATE TABLE `user_demand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '需求id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `money_situation` smallint(5) unsigned NOT NULL COMMENT '我的资金:1:50万以下 2:50万到100万 3:100万到300万 4:300万以上',
  `earning_type` smallint(5) unsigned NOT NULL COMMENT '收益类型:1:固定收益 2:浮动+保底 3:浮动收益 ',
  `expected_deadline` smallint(5) unsigned NOT NULL COMMENT '期望期限:1:6个月以内 2:6到12个月 3:12到24个月 4:24个月以上 ',
  `additional_remarks` varchar(1024) DEFAULT NULL COMMENT '补充说明',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1:为删除 0:未删除',
  `is_closed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭 1:为关闭 0:未关闭',
  `last_batch_sid` bigint(20) unsigned DEFAULT NULL COMMENT '上一次跑批匹配方案的id',
  `match_solution_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '跑批匹配方案数',
  `serial_number` bigint(20) unsigned NOT NULL COMMENT '需求编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户需求表';

CREATE TABLE `user_demand_solution` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '需求方案匹配id',
  `demand_user_id` bigint(20) unsigned NOT NULL COMMENT '需求用户id',
  `demand_id` bigint(20) unsigned NOT NULL COMMENT '需求表id',
  `solution_user_id` bigint(20) unsigned NOT NULL COMMENT '方案用户id',
  `solution_id` bigint(20) unsigned NOT NULL COMMENT '方案表id',
  `is_read_demand` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '理财师是否已读匹配需求 1:为已读 0:未读',
  `is_operate_solution` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '投资人是否操作匹配方案 2:已采纳1:为已读 0:未读',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户需求方案匹配表';

CREATE TABLE `user_finance_detail` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `education_level` varchar(32) DEFAULT NULL COMMENT '文化程度',
  `school_name` varchar(128) DEFAULT NULL COMMENT '毕业院校',
  `work_age` smallint(5) DEFAULT NULL COMMENT '从业年限',
  `position` varchar(128) DEFAULT NULL COMMENT '职位',
  `service_direction` varchar(512) DEFAULT NULL COMMENT '服务方向',
  `service_concept` varchar(512) DEFAULT NULL COMMENT '服务理念',
  `working_experience` varchar(512) DEFAULT NULL COMMENT '从业经历',
  `personal_profile` varchar(512) DEFAULT NULL COMMENT '个人简介',
  `is_add` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否添加 1:为已添加 0:未添加',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1:为删除 0:未删除',
  `loan_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '关联产品数量',
  `user_order_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户预约数',
  `adopt_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '总采纳数',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理财师详情';

CREATE TABLE `user_friend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '好友关系表id',
  `my_user_id` bigint(20) unsigned NOT NULL COMMENT '我的用户id',
  `friend_user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友关系表';

CREATE TABLE `user_friend_count` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT '我的用户id',
  `friend_counts` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '好于数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的好友统计';

CREATE TABLE `user_institution_detail` (
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'user表主键id',
  `name` varchar(32) NOT NULL COMMENT '机构名称',
  `contact_name` varchar(32) NOT NULL COMMENT '机构联系人',
  `contact_mobile` varchar(32) NOT NULL COMMENT '机构联系人电话',
  `is_personal` tinyint(3) unsigned NOT NULL COMMENT '是否个人机构 1:为个人机构 2:企业机构',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1:为删除 0:未删除',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  UNIQUE KEY `unique_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构详情';

CREATE TABLE `user_realname_auth_record` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `real_name` varchar(64) NOT NULL COMMENT '姓名',
  `id_card` varchar(64) NOT NULL COMMENT '身份证',
  `response_message` varchar(1024) DEFAULT NULL COMMENT '返回报文',
  `flag` smallint(5) unsigned DEFAULT '0' COMMENT '0为初始化,1为正确,2错误',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户实名认证记录表';

CREATE TABLE `user_service_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id谁服务',
  `person_user_id` bigint(20) unsigned NOT NULL COMMENT '被服务用户id',
  `service_type` tinyint(3) unsigned NOT NULL COMMENT '1:为咨询2:预约',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理财师服务记录';

CREATE TABLE `user_solution` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '方案id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `money_situation` smallint(5) unsigned NOT NULL COMMENT '我的资金:1:50万以下 2:50万到100万 3:100万到300万 4:300万以上',
  `earning_type` smallint(5) unsigned NOT NULL COMMENT '收益类型:1:固定收益 2:浮动+保底 3:浮动收益 ',
  `expected_deadline` smallint(5) unsigned NOT NULL COMMENT '期望期限:1:6个月以内 2:6到12个月 3:12到24个月 4:24个月以上 ',
  `solution` varchar(1024) DEFAULT NULL COMMENT '投顾方案',
  `risk_assessment_level` smallint(5) unsigned DEFAULT NULL COMMENT '风险测评等级冗余',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 1:为删除 0:未删除',
  `is_closed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭 1:为关闭 0:未关闭',
  `match_demand_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '跑批匹配需求数',
  `read_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '方案已读数',
  `adopt_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '方案采纳数',
  `serial_number` bigint(20) unsigned NOT NULL COMMENT '方案编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户方案表';

CREATE TABLE `user_surver` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `answers` text NOT NULL COMMENT '答案记录',
  `risk_assessment_level` smallint(5) unsigned NOT NULL COMMENT '风险测评等级',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户风险评测表';
