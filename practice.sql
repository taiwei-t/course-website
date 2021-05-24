/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : practice

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 24/05/2021 22:06:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，唯一标识',
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_brief` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程简介',
  `curriculum_time` date NULL DEFAULT NULL COMMENT '开课时间',
  `session_time` date NULL DEFAULT NULL COMMENT '结课时间',
  `course_classify` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程分类',
  `teacher_id` bigint NOT NULL COMMENT '授课老师',
  `textbook` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教材',
  PRIMARY KEY (`uid`, `course_no`, `teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '100001', '数据结构', '《数据结构》课程是计算机科学与技术的学科基础课程，是许多计算机课程的先导课程。', '2020-03-01', '2020-07-01', '计算机', 1, '《数据结构》');
INSERT INTO `course` VALUES (1, '100002', '犯罪心理学', '犯罪心理学（Criminal Psychology）研究作为反映社会的犯罪心理和行为规律的学科。介于自然科学与社会科学之间的跨界学科。既是心理学的一个分支又是犯罪学的一个分支。', '2021-05-02', '2021-05-07', '心理学', 1, '《犯罪心理学》');
INSERT INTO `course` VALUES (1, '100003', '微观经济学', '微观经济学（Microeconomics）(“微观”是希腊文“ μικρο ”的意译，原意是“小\")又称个体经济学，小经济学，是现代经济学的一个分支，主要以单个经济单位（单个生产者、单个消费者、单个市场经济活动）作为研究对象分析的一门学科。', '2018-05-14', '2019-05-17', '经济管理', 3, '《微观经济学》');
INSERT INTO `course` VALUES (1, '100004', '大学英语1', '大学英语基础课程', '2020-05-05', '2021-09-25', '英语', 4, '《大学英语1》');
INSERT INTO `course` VALUES (1, '100005', '大学英语2', '大学英语基础课程', '2020-05-11', '2021-08-20', '英语', 7, '《大学英语2》');
INSERT INTO `course` VALUES (1, '100006', '园林设计', '园林设计就是在一定的地域范围内，运用园林艺术和工程技术手段，通过改造地形（或进一步筑山、叠石、理水），种植树木、花草，营造建筑和布置园路等途径创作而建成美的自然环境和生活、游憩境域的过程。', '2018-05-07', '2019-05-16', '农林园艺', 7, '《园林设计》');
INSERT INTO `course` VALUES (2, '100007', 'C语言程序设计', 'C语言程序设计是计算机基础课程', '2018-05-13', '2021-05-13', '计算机', 2, '《C语言程序设计》');
INSERT INTO `course` VALUES (3, '100008', '操作系统', '操作系统课讲解操作系统中如何管理和协调应用程序对计算机系统中软硬件资源的使用。', '2020-05-18', '2021-01-22', '计算机', 1, '《操作系统课》');
INSERT INTO `course` VALUES (4, '100009', '农药学', '农药是人类与有害生物斗争的法宝，更是世界粮食安全生产和人类健康生活的保障，在病、虫、草、鼠等有害生物的综合治理中具有不可替代的作用。《农药学》是植保专业本科生的专业核心课，同时也是农学、园艺和林学等专业的必修或选修课，具有农业化学与生物学、环境科学、农学等学科交叉特点，兼备理论性和实践性，对从事农药研发、推广应用、流通管理等领域的专业人员和科技工作者也具有较强的学习和参考价值。开启农药学课程学习，中国农业大学植物保护学院二级教授领衔教学团队，将带你一起领略农药学这一交叉学科的风采！', '2020-05-18', '2021-05-15', '农林园艺', 1, '《农药学》');

-- ----------------------------
-- Table structure for course_copy
-- ----------------------------
DROP TABLE IF EXISTS `course_copy`;
CREATE TABLE `course_copy`  (
  `course_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_classify` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程分类',
  PRIMARY KEY (`course_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_copy
-- ----------------------------
INSERT INTO `course_copy` VALUES ('100001', '数据结构', '计算机');
INSERT INTO `course_copy` VALUES ('100002', '犯罪心理学', '心理学');
INSERT INTO `course_copy` VALUES ('100003', '微观经济学', '经济管理');
INSERT INTO `course_copy` VALUES ('100004', '大学英语1', '英语');
INSERT INTO `course_copy` VALUES ('100005', '大学英语2', '英语');
INSERT INTO `course_copy` VALUES ('100006', '园林设计', '农林园艺');

-- ----------------------------
-- Table structure for journalism
-- ----------------------------
DROP TABLE IF EXISTS `journalism`;
CREATE TABLE `journalism`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(4500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of journalism
-- ----------------------------
INSERT INTO `journalism` VALUES (43, '学习英语的重要性', '2021-04-06', '在当今这个学习英语风潮盛行的社会，英语似乎已经成为了我们生活中不可或缺的一部分，而我们到底为什么要学英语呢？学习英语的重要性到底体现在哪里呢？\n\n　　学习英语的重要性①    英语是当今世界上主要的国际通用语言这一，也是世界上广泛使用的语言。据1986年的统计， 世界上以英语为母语的人近4亿，差不多每十个人中就有一个人讲英语。英国、美国、加拿大、澳大利亚、新西兰等国家的人都讲英语。世界上约有20国家把英语作为官方语言或第二语言使用，共计约有8亿人。也就是说，世界上差不多每五个人中有一个人至少在一定程度上懂英语。若加了世界各国中小学生学习英语的人数，懂英语的人就更多了。\n\n　　学习英语的重要性②    英语的使用范围非常广泛。世界上70%以上的邮件是用英文写或用英文写地址的。全世界的广播节目中，有60%是用英语进行的。国际上的资料绝大部分是用英语发表的。绝大部分的国际会议是以英语为靠前通用语言,它也是联合国的正式工作语言之一。总之，在国际政治、军事、经济、科技、文化、贸易、交通运输等领域，英语是一个重要的交际工具。随着我国对外开放的不断扩大化,科技术的不断进步,国际地位的不断提高,迫切需要造就一大批精通外语的专门人才,以加速我国“四化”进程，使我国在国际事务中发挥更大更积极的作用。因此，学好英语对实现上述目标具有重要大的现实意义和深远的历史意义。我们需要学习别人的先进技术\n\n　　中国在近几十年的确发生了翻天覆地的变化，各方面都发展得很快。但是，不容置疑的是，我们在很多技术方面仍然落后于西方先进国家。要发展，要进步，要在较短的时间内掌握各种技术，我们不可能单靠自己搞研究，必须学习别人先进的技术。而学习的必要前提便是要掌握世界通用技术交流语言，我们的工具－英语。学习英语的重要性就计算机程序开发为例：虽然目前的计算机操作系统已经有中文版，但要进行应用程序开发，程序还是用英语编写的。高新技术资料大部分都是以英语编写。印度虽然在很多方面的发展比不上中国，但印度的软件开发业却比中国发达很多。造成这种差距，其中一个重要原因就是印度程序员普遍英语应用水平比中国程序员高。\n\n　　与世界各国合作需要英语\n\n　　我们在学习别人先进技术，经验的同时，也需要与世界各国展开各种技术上和经济上的合作。如果不懂英语，便无法与合作方沟通交流，也更谈不上合作了。譬如某公司开发了一个具有世界水平的产品，如果能打开国际市场，前途将是一片光明。但偏偏公司人员不懂英语，无法很好地与国外客户沟通，无法将产品的优良性能展示出来，这将是一个惨重的损失。\n\n　　如何学好英语\n\n　　了解了学习英语的重要性，那么我们到底要如何才能学好英文呢？\n\n　　学习英语的重要性根据实际应用需要学习\n\n　　既然我们先前讨论过英语实际上只是一门工具而已，那么，在学习之前，我们首先要清楚了解自己学习英语的目的。是文学创作，还是某项实际工作需要？相信大部分人都是因为工作需要而学习英语，那么英语只是一个让我们可以与西方国家交流，学习西方先进技术的工具。以往中国的英语教育以阅读大量文学作品为主，但实际上这种做法对与英语初学者来说弊大于利。例如一个 空中 小姐，她所需要掌握的只是口头上询问客人需要什么，或者报告当地天气等简单信息。阅读文学作品可以说对她的工作毫无帮助。我们学习英语之前应该反复强调把英语作为一门工具，并且要清楚知道我们究竟需要用这门工具来干什么。根据具体的需要来决定学习的内容和方法。如果您的职业是 空中 小姐，那么很明显，您并不需要看懂莎士比亚的著作。\n\n　　在中国发展到今天，英语已经不仅仅是一种语言了，它还是一种渠道和沟通的桥梁，了解学习英语的重要性更能够让我们热爱英语。', '王鑫');
INSERT INTO `journalism` VALUES (44, '多校划片是补充措施 将扩大免费教育‍以基础教育公平', '2021-05-04', '3月7日，教育部副部长刘利民通过教育部新闻办“微言教育”新媒体平台，以“基础教育公平”为主题与网友交流。刘利民表示，十三五期间将扩大免费教育范围，多校划片只是阶段性的补充措施。\n\n　　在一个多小时的访谈里，刘利民回复了15个提问，涉及多校划片、幼儿园小学化等多个教育热点话题。\n\n　　“解决择校终靠扩大优质教育资源”\n\n　　2016年年初，《教育部办公厅关于做好2016年城市义务教育招生入学工作的通知》印发，其中规定：科学确定划片方式。在目前教育资源配置不均衡、择校冲动强烈的地方，要根据实际情况，积极稳妥采取多校划片，将热点小学、初中分散至每个片区，确保各片区之间大致均衡。\n\n　　这一规定引起人们对“多校划片”的关注和热议，昨天有多位网友就此提问：“‘多校划片’政策真的能让教育资源均等化吗？”\n\n　　对此，刘利民表示，“多校划片只是阶段性的补充措施，解决择校问题，终还要靠扩大优质教育资源，办好每所学校”。\n\n　　之所以推出这一政策，刘利民认为，国家大力推进义务教育均衡发展，校际差距明显缩小，但教育资源配置不均衡问题仍然存在。在总结地方实践基础上，我们推出了多校划片政策，指导择校热点地区实现机会公平，使学生享有平等进入优质学校的机会。\n\n　　严禁组织小学入学考试\n\n　　一位网友提问时表示，“现在孩子们的竞争起点越来越靠前，甚至从小学到了幼儿园。”\n\n　　对于“幼儿园小学化”的问题，刘利民介绍，教育部一直努力纠正学前教育“小学化”现象，印发了《3-6岁儿童学习与发展指南》。\n\n　　刘利民表示，根治“小学化”需要全社会的共同努力，重点是推动幼小衔接，严禁组织小学入学考试，坚持“零起点”教学，消除家长“跟不上”的担忧。\n\n　　今年3月1日，教育部公布了新修订的《幼儿园工作规程》，里面对“幼儿园小学化”问题给出了明确要求：“幼儿园不得提前教授小学教育内容，不得开展任何违背幼儿身心发展规律的活动。”\n\n　　“鼓励各地实施一定年限的免费教育”\n\n　　在昨天的访谈交流中，刘利民还回应了“扩大免费教育范围”的问题。\n\n　　刘利民表示，目前我国九年义务教育全免费。国家正在研究在十三五期间分步实施九年以上免费教育的政策，免费中等职业教育在逐步推行，覆盖面已达92%；普通高中将率先对建档立卡家庭经济困难学生免除学杂费。\n\n　　对于一些地方在学前和高中阶段也实施了一定年限的免费教育，刘利民称，“我们鼓励和支持各地的这些做法”。\n\n　　据媒体报道，在今年的两会上，全国人大代表、河北省邢台市副市长史书娥就提交了一份《关于将高中段教育纳入义务教育体系的建议》，并表示，“邢台市的清河县和广宗县，于2014年成功实现了普通高中的免费教育，显著提高了当地青少年的受教育水平。”', '王鑫');
INSERT INTO `journalism` VALUES (45, '备战2016中考：家长应该做些什么？这一年不仅仅是孩...‍‍', '2021-05-16', '准初三的同学们面对2015中考已经开始了紧张的学习，其实这一年不仅仅是孩子们拼搏奋斗的一年，还是家长们应该为孩子做好规划指导的一年，为了让家长们做好2014年中考考生的合格家长。希望大家都能给自己的孩子一个完美的规划。\n\n　　作为一个新初三的家长应该开始了解中考过程中的一些重要节点了，比如：中考报名、中考体育、中考签约、志愿填报等等，当家长了解了中考过程中的这些关键点，才能为孩子做好下一步的铺垫，由于升学这块涵盖的范围比较大，所以重点讲下中考签约和志愿填报。\n\n　　首先来说说中考签约，这里面需要注意的地方颇多，其实这点家长应该从孩子的初二就应该开始关注了，因为有的孩子在初二下学期期末考试结束之后，由于成 绩突出，就会被一些名校看重而签约，另外等孩子上了初三以后，很多学校在签约的时候是关注初二下学期的期末成绩的，所以这次考试的成绩（包括各科的成绩） 希望家长能够记录下来备用。不过现在已经是新初三了，估计现在和大家说这些有点晚了，不过切莫错过初三这一年中重要的两次签约即可，进入初三之后，早的 一次就是初三上半年的期末，这也是全区靠前次大排名，能够看出自己的孩子在什么样的位置，衡量出自己的水平，这次成绩不要忽视，好好备考为好。当进入到三 月份的时候，各名校会举办一些中招咨询会，咨询会当天会全面为家长学生开放，这天，关注学校的家长，可以直接到现场进一步了解学校的情况，为孩子升学做好 准备。后一次大批签约是在五月份的中考一模之后，这次考试相当于一次小型的中考，题目偏难些，主要目的也是选拔一些优秀的孩子。如果家长能够提前知道这 些关键的考试，那么就可以帮助引导孩子在这几次的考试上发挥的更好些。\n\n　　其次再来说说志愿填报，这里过多的细节暂时不深入展开，主要讲讲在报志愿的时候家长应该做到基本的几点。中考结束了，也收到很多家长反应，因为食堂 的问题、教学设备的问题、离家远近的问题、分文理科的问题等等，后悔报这个志愿了，并且还被这所学校录取了，孩子死活不愿意去，对这所学校产生了抵触的情 绪，问该怎么办？那么，当时身为家长在报考志愿的时候，为什么不把学校的实际情况摸清楚再进行志愿填报呢？这是个值得深思的问题，孩子的主要目标是就好好 学习，作为一个初三的家长就应该无条件的做好后勤工作，这点是毋庸置疑的，下面举例子来说明这个问题：\n\n　　家长：现在可愁坏了，XX学校没有食堂，孩子需要统一订营养餐，并且是一订就需要订一个月的，有的时候孩子不喜欢吃，就不吃了，这点真是令我非常郁闷，害怕孩子营养跟不上，后来让孩子每天上学带上一个保温桶，如果饭不好吃就带回家，作为父母的晚餐。\n\n　　分析：像这样的问题，主要责任在家长，在填报志愿的时候没有考察清楚学校的实际情况，就根据分数简单的进行志愿填报造成的后果。\n\n　　家长：孩子实验落榜，无奈进入了八中，现在觉得孩子更偏向文科些，打算报偏文科的班，觉得有些纠结。\n\n　　分析：其实这就是典型的没有关注孩子自身的学习情况，父母根据自己的意愿就开始志愿填报了，如果提前知道孩子偏文科些，那为什么在填报志愿的时候不选 择二附的文科实验班呢？即使进入不到实验班，二附普通班的实力也会偏高于八中的文科，这点算是填报志愿时候只考虑分数，不考虑孩子的自身学习情况，造成的 后果。', '王鑫');
INSERT INTO `journalism` VALUES (46, '教育部：2016年将召开全国民办教育工作会议提出了...‍‍‍', '2021-05-02', '人民网北京2月5日电 （记者林露）记者从教育部官网获悉，今天教育部发布的《2016年工作要点》提出，要进一步扩大高职分类考试录取的比例，还将扩大重点高校面向农村贫困地区学生定向招生计划。\n\n　　制订实施教育“十三五”规划\n\n　　教育部表示，将制订实施教育“十三五”规划。做好教育“十三五”规划编制工作，明确“十三五”时期教育改革发展的指导思想、目标任务和重大政策举措。\n\n　　教育部提出，将推进民办教育分类改革，进一步修改并出台鼓励社会力量兴办教育促进民办教育健康发展的若干意见。研究制订民办学校分类登记实施细则、营利性民办学校监督管理实施细则等，有序实施民办学校分类管理。召开全国民办教育工作会议。\n\n　　重点高校将招收更多农村贫困生\n\n　　根据工作要点，教育部将深化考试招生制度改革。指导各地落实考试招生制度改革实施方案。印发进一步做好义务教育招生入学工作文件。加强普通高中教学管理和学生综合素质评价工作指导。加快推进高职分类考试改革，突出“文化素质+职业技能”考核评价方式，进一步扩大高职分类考试录取的比例。推进考试内容改革，充分发挥高考命题的育人功能和积极导向作用。确保国家教育考试平稳安全有序进行。扩大重点高校面向农村贫困地区学生定向招生计划。加强对特殊类型招生的规范管理。\n\n　　同时，还将探索研究生招生计划分类管理改革办法，推进专业学位硕士研究生考试招生改革试点，进一步扩大博士研究生招生“申请-考核”和“分流淘汰”机制。研究制订成人高校考试招生制度改革指导意见。落实和完善随迁子女在当地参加中考、高考政策。加大对高校招生的监管力度，落实招生信息“十公开”，严肃查处各类违规招生行为。\n\n　　做好教育管办评分离改革试点\n\n　　教育部将深入推进教育管办评分离。深化教育行政审批制度改革，进一步规范教育行政审批行为，推进教育行政审批网上平台建设。进一步落实和扩大省级政府教育统筹权，进一步落实和扩大高校办学自主权。推进中小学章程和现代学校制度建设，推进高校完善内部治理结构，健全学术委员会、理事会等制度，建立健全高校章程实施的监督机制。加快完善国家教育标准体系。做好教育管办评分离改革试点工作。推进部属事业单位分类改革和机构布局优化调整。\n\n　　制订实施高校科技发展“十三五”规划\n\n　　教育部表示，将加快优异大学和优异学科建设。制订“双优异”实施办法，研究制订资金管理、绩效评价办法，建立信息公示网络平台。推进教育人才发展体制机制改革，更大力度落实“千人计划”“万人计划”等国家重大人才工程，深入实施“长江学者奖励计划”，进一步加大向中西部、东北部地区倾斜力度，加大力度支持培养青年人才。\n\n　　教育部还将制订实施高校科技发展“十三五”规划，推进体制机制创新。组织高校承担国家重大科学基础设施和国家实验室建设任务，组织高校参与国家重大科技计划项目，建立完善高校基础研究稳定支持机制。完善促进科技成果转化的政策机制，推动高校建立知识产权运营机构。深入推进科技评价改革，完善教师考核评价和学科评估机制。持续推进“2011计划”取得实效。深化高校人文社科重点研究基地改革，启动高校专业化智库建设。\n\n　　今年春季学期起统一城乡义务教育学校生均公用经费基准定额\n\n　　根据工作要点，教育部将着力提高教育经费保障与管理水平。督促各地依法落实教育经费法定增长，建立健全教育投入长效机制。从2016年春季学期起统一城乡义务教育学校生均公用经费基准定额，督促各地落实中职学校和高职院校生均拨款制度。推动建立健全地方所属高校研究生教育生均拨款制度。完善非义务教育阶段成本分担机制，规范学校收费管理。推进中央高校预算拨款制度改革。加强改进教育经费统计工作，加大教育经费使用监管力度，推动财务信息公开。\n\n　　开展好研究生学位论文抽检\n\n　　进一步强化教育督导。印发《地方政府履行教育职责督导评价暂行办法》。继续开展义务教育均衡发展督导评估认定。开展中小学校责任督学挂牌督导创新县（市、区）评估认定。印发《中小学校素质教育督导评估办法》《中小学校管理评价办法》。开展中等职业学校办学能力评估和高等职业院校适应社会需求能力评估，制订高等职业院校专业评估试点方案。开展好义务教育质量监测、普通高校本科教学评估、研究生学位论文抽检。\n\n　　起草完成《国家教育考试条例（草案）》\n\n　　2016年，教育部将大力推进依法治教。加强教育立法，配合做好《民办教育促进法》修正案审议，起草上报《职业教育法修正案（草案）》。起草完成《学校安全条例（草案）》《国家教育考试条例（草案）》。落实《全面依法治教实施纲要（2016-2020年）》，推进教育行政部门依法行政、学校依法治校能力建设，深化教育行政执法体制改革，建立健全教育系统法律顾问制度。全面加强学校法治教育, 实施《青少年法治教育大纲》。推进青少年法治教育实践基地建设，健全青少年法治教育的支持体系和评价机制。启动依法治校示范校和法治校园创建活动。研究制订关于加强学校安全风险防控机制建设的意见。进一步做好教育行政复议和行政应诉工作。\n\n　　出台《学校招收和培养国际学生办法》\n\n　　教育部将完善教育对外开放战略布局。落实“一带一路”战略，深入开展教育合作交流。充实中俄、中美、中英、中欧、中法、中印尼六个高级别中外人文交流机制内涵，开创人文交流新局面。推动与教科文组织建立高层定期磋商机制。贯彻《关于做好新时期教育对外开放工作的若干意见》。出台《学校招收和培养国际学生办法》《高等学校国际学生勤工助学管理办法》。打造“留学中国”品牌，优化出国留学服务。试点探索职业教育与企业合作“走出去”的发展模式。编制孔子学院“十三五”行动计划。加强内地与港澳教育交流合作。', '王鑫');
INSERT INTO `journalism` VALUES (47, '2015年度教育关键词盘点：乡村教师备受关注...', '2021-05-15', '2015作为“十二五”收官之年，我国教育事业发展持续发力。借“双创”“互联网+”等概念崛起之东风，中国的教育事业历经大刀阔斧的改革之后成果初显。\n\n　　我国教育事业发展之快令世界惊叹，然而，教育改革之路仍任重道远。今年我国继续加大力度、深入改革，力争消除存在于教育事业中的“顽疾”，以使我国教育能够健康得快速发展。\n\n　　随着年终的临近，新华教育特此盘点2015年度教育十大关键词，共同见证中国教育成长！\n\n　　1、互联网+教育\n\n　　毫无疑问，中国社会在形态上已经进入信息化时代，无论是网民数量还是网络经济发展的速度，均堪称世界靠前。而当总理在《政府工作报告》中先后8次提到互联网、移动互联网等新兴行业，并且提出了“互联网+”这个新概念后，更是每天引来上百万网民的点赞。可以说，“互联网+”在中国的迅猛发展，不但提升了一个又一个传统行业的层次，也给每一个人带来了机遇、希望与挑战。那么对于中国教育领域，“互联网+”又意味着什么呢？那就是教育内容的持续更新、教育样式的不断变化、教育评价的日益多元，一言以蔽之，中国教育正进入到一场基于信息技术的更伟大的变革中。\n\n　　2、创新创业教育\n\n　　国务院办公厅印发《关于深化高等学校创新创业教育改革的实施意见》(以下简称实施意见)。实施意见提出，到2020年建立健全课堂教学、自主学习、结合实践、指导帮扶、文化引领融为一体的高校创新创业教育体系，人才培养质量显著提升，学生的创新精神、创业意识和创新创业能力明显增强，投身创业实践的学生显著增加。中国每年有700多万高校毕业生走向社会，推动“大众创业、万众创新”，离不开具有活力的高校学生，已成各界共识。然而，大学生创业去年在工商部门登记数量只有48万。2.1%的大学生创新创业比例相较于发达国家仍有较大差距。\n\n　　为鼓励学生创新创业，改革教学和学籍管理制度势在必行。此次实施意见规定，高校要设置合理的创新创业学分，建立创新创业学分积累与转换制度。高校要为有意愿有潜质的学生制定创新创业能力培养计划，建立创新创业档案和成绩单。支持参与创新创业的学生转入相关专业学习。实施弹性学制，放宽学生修业年限，允许调整学业进程，保留学籍休学创新创业。\n\n　　3、乡村教师\n\n　　国务院办公厅今年印发《乡村教师支持计划（2015－2020年）》，全面部署乡村教师队伍建设工作。《计划》指出，到2020年全面建成小康社会、基本实现教育现代化，薄弱环节和短板在乡村，在中西部老少边穷岛等边远贫困地区。发展乡村教育，帮助乡村孩子学习成才，阻止贫困现象代际传递，是功在当代、利在千秋的大事。必须把乡村教师队伍建设摆在优先发展的战略地位。要聚焦乡村教师队伍建设关键领域、紧迫任务，打出组合拳，多措并举，定向施策，精准发力，标本兼治，到2020年，努力造就一支素质优良、甘于奉献、扎根乡村的教师队伍。\n\n　　4、校园足球\n\n　　《中国足球改革发展总体方案》为校园足球勾画的蓝图很清晰。从教育部主导的顶层设计，到“足球特色学校2025年达到5万所”的具体目标，这一年，全国范围内的学校几乎同时吹响“足球集结号”。\n\n　　校园足球有多火？据教育部公布的数据，截至2015年8月，全国首批认定的青少年足球特色学校多达8627所，试点县区有38个。如果深入各地，校园足球“自选动作”更给力，单列招收足球特长生、政府购买青训服务等探索令人目不暇接——校园足球正在经历充分的“量变”，“质变”还会远吗？\n\n　　5、向应用型转变\n\n　　教育部、发展改革委、财政部日前印发《关于引导部分地方普通本科高校向应用型转变的指导意见》。这标志着我国高等教育“重技重能”时代即将来临，标志着对“手”的教育的理性回归。\n\n　　目前，我国已经建成了世界上较大规模的高等教育体系，为现代化建设作出了巨大贡献。但随着经济发展进入新常态，高等教育结构性矛盾更加突出，同质化倾向严重，毕业生就业难和就业质量低的问题显现。\n\n　　教育部相关负责人表示，要破解人才培养与经济社会发展需求的结构性矛盾，必须加强顶层设计，实行高等教育分类改革，解决部分地方高校的办学定位问题，引导这些高校走与地方经济社会发展和产业技术进步融合发展之路，推动高等学校科学定位、特色发展和质量提升，全面增强地方高校服务区域经济社会发展的能力。\n\n　　6、高考改革\n\n　　无论是对于这些考生，还是对于始终在探索的高考改革，2015年注定是一个值得记忆的年份。在《国务院关于深化考试招生制度改革的实施意见》公布后，一系列改革措施陆续出台，为高考带来很多新变化，也为民众期待的高考公平与科学带来新期待.\n\n　　奥赛奖牌、体育特长不再是加分“王牌”，三好学生、优秀干部逐渐褪去光环……新高考改革方案规定从今年起取消体育、艺术等特长生加分项目。地方性高考加分项目由省级人民政府确定并报教育部备案，原则上只适用于本省（区、市）所属高校在本省（区、市）招生。今年，新高考改革方案规定“自主招生安排在全国统一高考后进行”，让不少考生和家长感到“负担有所减轻”。\n\n　　7、作弊入刑\n\n　　12月17日，教育部表示，根据2015年新实施的《刑法修正案》，在研考等国家考试中作弊将被追究刑责，处以管制、拘役、有期徒刑等不同程度的处罚。\n\n　　《刑法修正案(九)》已于2015年11月1日起施行，其中明确规定，考试作弊行为将被追究刑责。具体包括：在法律规定的国家考试中，组织作弊的，处三年以下有期徒刑或者拘役，并处或者单处罚金；情节严重的，处三年以上七年以下有期徒刑，并处罚金。为他人实施前款犯罪提供作弊器材或者其他帮助的，依照前款的规定处罚。为实施考试作弊，向他人非法出售或者提供试题、答案以及替考行为，都将受到刑罚处罚。\n\n　　8、教师职称改革\n\n　　8月26日，国务院召开常务会议，决定全面推开中小学教师职称制度改革，在教师节即将来临之际，给1270万名中小学教师送上了一份“大礼包”。\n\n　　改革：将分设的中学、小学教师职称（职务）系列统一为初、中、高级\n\n　　此前，中小学教师在评职称方面有个“天花板”，无论是小学教师，还是中学教师，较高都只能评“中学高级教师”职称，相当于“副高”，而且名额极少，在评职称上，中小学教师“低人一等”。\n\n　　9、教育反腐\n\n　　教育部党组对违反中央八项规定精神问题严肃查处，决不手软，一抓到底。日前，严肃查处了中国传媒大学个别党员领导干部违反中央八项规定精神问题。11月24日，教育部党组研究决定，对中国传媒大学党委书记陈文申、校长苏志武等8名党员领导干部违纪问题进行通报，按照程序分别给予纪律处分和组织处理。不久之后，教育部又对近期查处的中央音乐学院、北京邮电大学、对外经济贸易大学等3所部属高校4起违反中央八项规定精神问题等典型案件进行通报。\n\n　　教育部部长袁贵仁表示，密集通报和曝光一批违规违纪问题，就是要释放一种强烈信号，党风廉政建设和反腐败是一场输不起的斗争，全面从严治党是各级党组织的政治责任，教育系统绝不允许不正之风和腐败问题有存在之地，也绝不允许个别领导干部在其位不履职、不尽责、不担当。\n\n　　10、双优异建设\n\n　　国务院日前印发《统筹推进世界优异大学和优异学科建设总体方案》，要求按照“四个全面”战略布局和党中央、国务院决策部署，坚持以中国特色、世界优异为核心，以立德树人为根本，以支撑创新驱动发展战略、服务经济社会发展为导向，坚持“以优异为目标、以学科为基础、以绩效为杠杆、以改革为动力”的基本原则，加快建成一批世界优异大学和优异学科。\n\n　　根据《总体方案》，到2020年，我国若干所大学和一批学科进入世界优异行列，若干学科进入世界优异学科前列；到2030年，更多的大学和学科进入世界优异行列，若干所大学进入世界优异大学前列，一批学科进入世界优异学科前列，高等教育整体实力显著提升；到本世纪中叶，优异大学和优异学科的数量和实力进入世界前列，基本建成高等教育强国。', '王鑫');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentId` int NULL DEFAULT NULL,
  `enabled` tinyint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/admin', NULL, 1, '所有', '');
INSERT INTO `menu` VALUES (2, '/admin/home', 1, 1, '所有管理', 'Home');
INSERT INTO `menu` VALUES (3, '/admin/db', 2, 1, '成绩管理', 'Score');
INSERT INTO `menu` VALUES (4, '/admin/information', 2, 1, '基本信息', 'Information');
INSERT INTO `menu` VALUES (5, '/admin/student', 2, 1, '学生管理', 'Student');
INSERT INTO `menu` VALUES (6, '/admin/home', 1, 1, '权限管理', 'Home');
INSERT INTO `menu` VALUES (7, '/admin/user', 6, 1, '用户管理', 'UserManage');
INSERT INTO `menu` VALUES (8, '/admin/teacher', 2, 1, '教师管理', 'Teacher');
INSERT INTO `menu` VALUES (9, '/admin/course', 2, 1, '课程管理', 'Course');
INSERT INTO `menu` VALUES (10, '/admin/journalism', 2, 1, '新闻管理', 'Journalism');

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (1, 3, 1);
INSERT INTO `menu_role` VALUES (2, 4, 2);
INSERT INTO `menu_role` VALUES (3, 5, 3);
INSERT INTO `menu_role` VALUES (4, 7, 2);
INSERT INTO `menu_role` VALUES (5, 8, 3);
INSERT INTO `menu_role` VALUES (6, 9, 3);
INSERT INTO `menu_role` VALUES (7, 10, 1);
INSERT INTO `menu_role` VALUES (8, 1, 4);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES (2, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');
INSERT INTO `role` VALUES (4, 'ROLE_public', '公共页面');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (29, '徐昊', 22, '男');
INSERT INTO `student` VALUES (31, 'hello', 23, '男');
INSERT INTO `student` VALUES (32, '哈哈', 22, '男');

-- ----------------------------
-- Table structure for student_copy
-- ----------------------------
DROP TABLE IF EXISTS `student_copy`;
CREATE TABLE `student_copy`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student_copy
-- ----------------------------
INSERT INTO `student_copy` VALUES (23, '徐昊', 22, '男');
INSERT INTO `student_copy` VALUES (25, '阿旺', NULL, NULL);
INSERT INTO `student_copy` VALUES (27, '信息', 35, 'VC');
INSERT INTO `student_copy` VALUES (28, '徐哈', 22, '男');

-- ----------------------------
-- Table structure for student_count
-- ----------------------------
DROP TABLE IF EXISTS `student_count`;
CREATE TABLE `student_count`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of student_count
-- ----------------------------
INSERT INTO `student_count` VALUES (1, 3);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `party` tinyint(1) NULL DEFAULT 0 COMMENT '入党情况',
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `emil` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `rank` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `degree` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学位',
  `course` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '所授课程',
  `brief` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `hiredate` date NULL DEFAULT NULL COMMENT '入职时间',
  `evaluation` int NULL DEFAULT NULL COMMENT '能力评价',
  `research` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '研究方向',
  `hobby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爱好',
  `college` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '张三', 32, '女', 1, '北京市,市辖区,东城区', '15310842544', 'zhangsan@qq.com', '教授', '硕士', '操作系统,Java程序设计,C语言程序设计', '你好，世界！\n21321323\n1323123213\n123123213', '2021-03-29', 4, '人工智能,图像处理,Web开发,电子商务', '运动,音乐', '文学院');
INSERT INTO `teacher` VALUES (4, '王二', 34, '男', 0, '天津市,市辖区,河东区', '13412341234', 'open-src@qq.com', '副教授', '硕士', '数据结构,C语言程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。', '2016-03-17', 4, '人工智能,Web开发', '阅读,舞蹈', '计算机于信息科学学院');
INSERT INTO `teacher` VALUES (5, '李二', 28, '女', 1, '河北省,秦皇岛市,北戴河区', '15723495844', 'hello@cqnu.edu.cn', '副教授', '博士', '数据库原理,C语言程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2021-03-15', 5, '人工智能', '音乐,游戏', '教育科学学院');
INSERT INTO `teacher` VALUES (6, '张三', 27, '男', 0, '山西省,长治市,武乡县', '15310843486', 'zsstudy@cqnu.deu.cn', '教授', '硕士', 'Java程序设计,数据结构', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2014-03-05', 4, '人工智能,Web开发', '阅读,游戏', '计算机于信息科学学院');
INSERT INTO `teacher` VALUES (8, '李四', 34, '男', 0, '重庆市,市辖区,万州区', '15923492358', '12313@cqnu.edu.cn', '副教授', '博士', '操作系统,C语言程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2011-08-10', 4, '人工智能', '阅读,舞蹈', '');
INSERT INTO `teacher` VALUES (10, '王五', 30, '男', 0, '山西省,运城市,闻喜县', '15936541422', '123@qwq.com', '讲师', '硕士', '面向对象程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2017-02-27', 3, '人工智能', '阅读,舞蹈', '');
INSERT INTO `teacher` VALUES (11, '张一', 32, '男', 1, '辽宁省,鞍山市,铁东区', '15926485934', '123@qq.com', '副教授', '博士', 'C语言程序设计,计算机导论', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2014-03-10', 5, '人工智能', '阅读,舞蹈', '');
INSERT INTO `teacher` VALUES (12, '张二', 31, '女', 1, '安徽省,蚌埠市,禹会区', '13348946875', '234@dad.com', '教授', '博士', '计算机组成原理,面向对象程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2016-03-15', 4, '人工智能', '阅读,舞蹈', '');
INSERT INTO `teacher` VALUES (13, '张四', 45, '男', 1, '湖南省,株洲市,荷塘区', '13956987854', '123@qwe.cn', '讲师', '硕士', 'C语言程序设计,软件工程导论', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2013-03-11', 4, '人工智能', '阅读,舞蹈', '');
INSERT INTO `teacher` VALUES (14, '王一', 28, '女', 1, '山东省,淄博市,张店区', '15923698745', '123@23.com', '副教授', '博士', 'C语言程序设计,计算机导论,Java程序设计', '全国高等院校计算机基础教育研究会常务理事；文科计算机基础教学指导分委员会专家；ISO国际标准组织专家及标准编辑；全国信息技术标准化技术委员会教育技术分技术委员会委员兼秘书长。主要从事计算机教育及教育信息化研究，主持和参加多项国家863、支撑计划课题和教育部课题。 主编出版教材20部，其中《C++语言程序设计》获教育部自然科学奖和国家级精品教材称号。起草教育信息化相关国家标准5部、国际标准1部。 获国家级教学成果奖、北京市教学成果奖、教育部自然科学奖、教育部科技进步奖、北京市科技进步奖、电子学会科技进步奖等9项国家级、教育部、北京市奖励。 在清华校内开设本科生课程：《计算机程序设计基础》、《C++语言程序设计》和《Java语言程序设计》;研究生课程有面向对象的软件开发技术', '2003-03-13', 4, '人工智能', '阅读,舞蹈', '');

-- ----------------------------
-- Table structure for teacher_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_copy`;
CREATE TABLE `teacher_copy`  (
  `uid` bigint NOT NULL AUTO_INCREMENT COMMENT '工号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `rank` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher_copy
-- ----------------------------
INSERT INTO `teacher_copy` VALUES (1, '张三', '教授');
INSERT INTO `teacher_copy` VALUES (4, '王二', '副教授');
INSERT INTO `teacher_copy` VALUES (5, '李二', '副教授');
INSERT INTO `teacher_copy` VALUES (6, '张三', '教授');
INSERT INTO `teacher_copy` VALUES (8, '李四', '副教授');
INSERT INTO `teacher_copy` VALUES (10, '王五', '讲师');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$50aIvzVPzHAtxR.2fR0RTesXsqOaJdpwGbM1dmIp9YGb6xhZVzU6S', NULL);
INSERT INTO `user` VALUES (2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL);
INSERT INTO `user` VALUES (9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL);
INSERT INTO `user` VALUES (10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (4, 3, 3);
INSERT INTO `user_role` VALUES (5, 1, 3);
INSERT INTO `user_role` VALUES (6, 1, 4);

SET FOREIGN_KEY_CHECKS = 1;
