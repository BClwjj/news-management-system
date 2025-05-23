-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: news
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `newsdetail`
--

DROP TABLE IF EXISTS `newsdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` datetime(6) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsdetail`
--

LOCK TABLES `newsdetail` WRITE;
/*!40000 ALTER TABLE `newsdetail` DISABLE KEYS */;
INSERT INTO `newsdetail` VALUES (1,'普京：俄罗斯不能以牺牲社会其他领域为代价无限制地增加军事开支','【环球网报道 见习记者 张倩】据“今日俄罗斯”（RT）17日报道，俄罗斯总统普京16日表示，俄罗斯不能以牺牲社会其他领域为代价无限制地增加军事开支，同时也要避免卷入一场全面的军备竞赛，损害俄罗斯社会和经济发展。\n报道称，普京当天在俄罗斯国防部高级官员会议上透露，俄罗斯目前的国防开支占其国内生产总值的6.3%。“为了国家生活的所有组成部分——经济、最广泛意义上的社会领域、科学、教育和医疗的发展，我们不能无限制地增加这些开支。”普京称。\nRT提到，普京表示，俄罗斯当前的国防开支水平尚未超过一些目前未卷入武装冲突的国家。“尽管如此，（但）这是一大笔钱，我们需要非常合理地使用它。”普京说，这包括支付给军队的款项，支持军事工业有效运转以及为军队提供装备、武器和弹药的费用。\n“按时接收所有东西，正确评估接收的东西，能够利用它而且能培训人员，正确有效地做到这一点非常重要。”普京表示。\n报道称，普京进一步解释说，虽然俄罗斯将采取措施确保自身及盟友的安全，但这将是“谨慎且经过深思熟虑的”，从而避免俄罗斯卷入一场全面的军备竞赛，损害国家的社会和经济发展。\n报道提到，普京表示，在武器开发的优先次序和引入先进技术方面，俄罗斯要吸取俄乌冲突的教训并应用于国防工业。普京补充说，尤其需要增加无人机的生产。\nRT还称，普京表示，战略核力量仍然是捍卫俄罗斯主权的关键工具之一，其现代化程度已达95%。普京提到，若齐射“榛树”中程高超音速弹道导弹，其威力堪比核武器，但不会产生任何放射性坠尘。此外，普京还在会议上透露，已有超过43万俄罗斯人自愿参军。','环球网记者张倩','2024-12-17 10:45:05.000000','军事','../images/detail3.jpg'),(2,'美媒爆：拜登政府正力争在特朗普明年1月就职前达成加沙停火协议','【环球网报道 记者 李梓瑜】据美国有线电视新闻网（CNN）当地时间10日报道，多名知情人士透露，拜登政府正与新一届美国政府官员开展越来越密切的合作，力争在美国当选总统特朗普明年1月20日就职前达成加沙停火和释放被扣押人员协议。\n报道称，不仅拜登政府希望在任期最后几周最终达成停火协议，而且特朗普也希望在开启他的第二任期之际，结束黎以和巴以冲突并释放被扣押人员。5名了解相关对话情况的消息人士透露，双方团队一直保持着密切协调。\n据美国Axios新闻网11月29日报道，美国南卡罗来纳州共和党参议员林赛·格雷厄姆在接受该媒体采访时表示，特朗普希望在明年1月20日就职前，看到达成加沙停火和释放被扣押人员协议。“我希望特朗普和拜登政府在过渡期间共同努力，释放被扣押人员并达成停火协议”，格雷厄姆说。报道提到，达成加沙停火协议是拜登任期最后两个月的首要任务之一，但最近几周没有取得明显进展，这意味着这个问题可能会交给特朗普来处理。','环球网记者李梓瑜','2024-12-10 20:53:20.000000','军事','../images/detail4.jpg'),(3,'韩特战部队司令官：尹锡悦亲自指示“把议员从国会会议厅里拉出来”','财联社12月10日电，韩国陆军特战部队司令郭种根当地时间10日在出席国会国防委员会的质询时表示，在宣布紧急戒严令后，尹锡悦总统“亲自用保密电话打电话给我说，‘国会主会议厅里好像还没有达到最低表决人数，赶紧破门而入，把里面的议员拉出来’”。听到这个指示后，郭种根在和现场指挥官商议后认为不能执行；因为即使是为了履行命令而闯入国会，进入国会的作战兵力“以后也会成为犯法者”，就中止了行动。\n郭种根还说，自己在本月1日就知道了有关紧急戒严的情况。时任国防部长官金龙显用保密电话指示他说，要“控制国会、中央选举管理委员会、共同民主党办公楼等三处，还有某民意调查机构等六处地点，限制这些地点的人员出入。而在宣布紧急戒严令当晚，尹锡悦曾两次致电郭种根，第一次是询问特战部队的位置，第二次是在4日凌晨0时30分到40分左右，下达了“拉出国会议员”的指示。','戴丽丽','2024-12-10 18:55:17.000000','军事','../images/detail5.jpg'),(4,'我国成功发射通信技术试验卫星十二号\n','中新网北京12月21日电 (马帅莎 崔婉莹)北京时间12月20日23时12分，我国在西昌卫星发射中心使用长征三号乙运载火箭，成功将通信技术试验卫星十二号发射升空，卫星顺利进入预定轨道，发射任务获得圆满成功。该卫星主要用于卫星通信、广播电视、数据传输等业务，并开展相关技术试验验证。\n北京时间12月20日23时12分，我国在西昌卫星发射中心使用长征三号乙运载火箭，成功将通信技术试验卫星十二号发射升空，卫星顺利进入预定轨道，发射任务获得圆满成功。该卫星主要用于卫星通信、广播电视、数据传输等业务，并开展相关技术试验验证。马永涛 摄\n此次任务是长征系列运载火箭的第554次飞行。(完)','新闻网','2024-12-21 02:49:05.000000','科技','../images/detail6.jpg'),(5,'顺丰航空接收第一架波音737—800货机','北京商报讯（记者 关子辰 牛清妍）12月21日，顺丰航空迎来首架波音737—800BCF。这架新飞机于当日飞抵鄂州花湖国际机场，加入顺丰机队，这是顺丰航空首次在鄂州枢纽迎接新机型，机队规模由此增长至88架。\n据介绍，波音737—800BCF以737NG为基础平台，最大业载可达23.9吨，飞行里程可达3750公里，相较上一代机型在载量、航程、燃油效率等方面更具优势。据测算，波音737-800BCF每吨燃油使用量和二氧化碳排放量最多可降低20%。\n此前，顺丰航空运营的机型包括波音747—400ERF、767—300BCF、757—200F、737CL（包括737—300、737—400）。随着首架波音737—800BCF加入，顺丰航空波音737机型的数量增长至18架，在机队中占比达20%。\n顺丰航空预计，今年底至明年初还将有新运力投运，机队规模将稳步向90架迈进。','关子辰、牛清妍','2024-12-21 13:23:05.000000','科技','../images/detail7.jpg'),(6,'在关键处落子，积极扎实做好“三农”工作','中央农村工作会议对做好2025年和今后一个时期“三农”工作进行了全面部署。做好“三农”工作，要以习近平总书记重要指示精神为根本遵循，从战略上布局、在关键处落子，坚持城乡融合发展，进一步深化农村改革，完善强农惠农富农支持制度，扎实推进乡村全面振兴。\n关键处落子，要落在城乡融合发展上。要跳出“三农”抓“三农”，统筹新型工业化、新型城镇化和乡村全面振兴，全面提高城乡规划、建设、治理融合水平，促进城乡要素平等交换、双向流动，缩小城乡差别，促进城乡共同繁荣发展。要顺应城乡融合发展大趋势，破除制度性壁垒，促进发展要素、各类服务更多下乡，有条件的地区要率先在县域内破除城乡二元结构。\n关键处落子，要落在进一步深化农村改革上。要全面落实进一步深化农村改革任务，有序推进第二轮土地承包到期后再延长三十年试点，探索闲置农房通过出租、入股、合作等方式盘活利用的有效实现形式，创新乡村振兴投融资机制，激发乡村振兴动力活力。在此过程中，要坚决守牢农村土地改革的底线，不能把农村土地集体所有制改垮了，不能把耕地改少了，不能把粮食生产能力改弱了，不能把农民利益损害了。\n关键处落子，要落在守住底线上。明年是巩固拓展脱贫攻坚成果同乡村振兴有效衔接5年过渡期最后一年，要牢牢守住不发生规模性返贫致贫底线，抓好巩固拓展脱贫攻坚成果各项工作，提升防止返贫致贫监测帮扶效能，统筹建立农村防止返贫致贫机制和低收入人口、欠发达地区分层分类帮扶制度，进一步提高精准帮扶效率，强化政府、市场、社会协同。要把产业、就业帮扶同完善强农惠农富农支持制度结合，落实大食物观、做好土特产文章，培育特色产业、培育市场品牌。（完）','新华社记者王立彬','2024-12-20 10:10:00.000000','农业','../images/detail2.png'),(7,'告别丢失烦恼：谷歌Android XR头戴式设备确认支持Find My Device','IT之家 12 月 21 日消息，科技媒体 Androidfaithful 于 12 月 18 日发布博文，采访了 Google 副总裁兼 AR / XR 总经理 Shahram Izadi，采访中确认 Android XR 智能眼镜等头戴式设备，将支持 Find My Device 功能。\nIT之家援引博文介绍，Izadi 在采访中表示，考虑到智能眼镜等 XR 设备容易丢失，谷歌正计划为 Android XR 设备支持“Find My Device”，并且该公司将很快分享更多细节。\n除了确认支持 Find My Device 之外，Izadi 还深入探讨了 Android XR 用于智能眼镜的“拆分计算配置”，将大部分复杂计算任务卸载到智能手机，并结合 Gemini 的云端处理能力，力求最大限度地减少用户操作延迟。\n此外 Android XR 针对 XR 设备的特性优化了电池管理，与其他平台上的 Android 系统相比，其后台进程、推送通知等处理方式可能有所不同。','IT之家','0024-12-21 12:54:06.000000','科技','../images/detail8.jpg'),(8,'工业粉尘防控与职业安全健康教育部重点实验室通过验收','中新网安徽新闻11月25日 安徽理工大学工业粉尘防控与职业安全健康教育部重点实验室验收会议于24日召开。\n　　会上，中国工程院院士，安徽理工大学党委副书记、校长，实验室主任袁亮从实验室建设背景与研究方向、实验室建设主要成效与典型成果、运行管理与开放交流、中长期发展目标规划等方面作了实验室建设情况汇报。\n　　据介绍，该实验室在建设期创建了煤矿井下空气净化科学试验集群，提出了井下空气污染物“分源-分区-分级-分策”治理方法；开展理工医协同攻关，对突破尘肺早期发现、诊断、治疗的瓶颈提供了新思路。实验室建设期共投入2.9亿元，新建科研教学用房4.2万平方米，围绕3个主要研究方向和需求，建成工业粉尘基础参数实验室、智能化喷雾降尘实验室、职业病发病与诊疗实验室等11个专业分实验室。\n　　实验室研究方向带头人围绕工业粉尘产尘机理与运移规律、工业粉尘防控关键技术和职业健康危害机制与防控等三个研究方向作了学术研究汇报\n　　在听取实验室建设工作总结报告、审阅相关资料以及现场考察、与实验室人员交流后，专家组认为实验室建设特色突出，面向“人民生命健康”，瞄准职业安全健康领域，聚焦行业重大需求，研究方向定位准确、成果丰硕、成效显著，成为“理工医融合、产教研协同”行业典范，同意工业粉尘防控与职业安全健康教育部重点实验室通过验收。\n　　安徽理工大学将瞄准国家重大战略需求和行业发展需要，继续聚焦职业安全健康方向，积极推进职业安全健康研究和学科建设，进一步加强科研成果转化和应用，把实验室建设成为行业背景突出、特色鲜明、国家战略引领的国际一流、国内领先的工业粉尘防控与职业安全健康国家级科研平台。（完）','武雷','2024-11-26 13:25:05.000000','教育','../images/detail9.jpg'),(9,'准备就绪！教育部提醒广大研考考生诚信考试','2025年全国硕士研究生招生考试将于2024年12月21日至22日举行。教育部深入贯彻落实习近平总书记等中央领导同志重要指示精神，树牢底线思维、极限思维，会同中央宣传部、中央网信办、中央保密办、工业和信息化部、公安部等国家教育统一考试工作部际联席会议成员单位，召开研考安全工作视频会议、印发专项工作文件，进行全面动员部署，联合开展综合治理考试环境专项行动，严守考试安全、公平底线；严肃考风考纪，强化人防、物防、技防相结合，大力推动考场综合安防体系建设；加强协调调度，指导各地全面排查整治考试组织安全隐患和薄弱环节、完善应急预案、优化考生服务，全力实现平安研考。各省（区、市）党委政府高度重视研考组织工作，加强组织领导，周密部署检查；教育部门积极会同各有关部门齐抓共管、协调联动，强化安全责任落实。 目前，全国研考各项工作准备就绪。\n全国硕士研究生招生考试是法律规定国家考试，凡在考试中作弊的考生，其作弊事实将依法记入《国家教育考试考生诚信档案》，并通报其所在学校或单位。广大考生应知法守法，严格遵守考试考场规则，切实履行诚信考试义务，以诚取信，以信取胜，莫拿个人诚信当儿戏。遵守考试纪律，不携带手机等违禁物品进入考场，不心存侥幸替他人或者让他人代替自己参加考试，不参与涉考违法犯罪活动；服从监考人员管理，主动接受身份核验和考试违禁物品检查。','教育部','2024-12-20 10:01:05.000000','教育','../images/detail9.jpg'),(10,'坤健生物科技：无农残韭菜的农业工业化新篇章','在当今全球农业发展的浪潮中，规模化经营已成为我们不可忽视的共同趋势。作为农业领域的积极探索者与实践者，安徽坤健生物科技有限公司正以前瞻性的视野和创新的理念，全力投身于无农残韭菜的农业工业化之路，努力开创属于我们的新篇章。\r\n农业工业化，是我们一直以来的追求。我们知道，将工业模式应用到农业生产中，发展现代化的大农业，是全球农业发展的必然趋势。因此，我们决定把这一理念引入到我们的无农残韭菜种植事业中。我们坚信，通过工业化思维，我们能够推动农业生产方式的转型升级，实现农业的高效、可持续发展。\r\n在这个过程中，我们总结了“九化”作为引领，它们构成了我们无农残韭菜种植事业的基石。首先，工业化思维和市场化的理念是我们做事的基调。我们不仅要注重产品的质量和效益，更要关注市场的需求和变化，让我们的无农残韭菜能够更好地适应市场，满足消费者的需求。我们明白，只有紧跟市场步伐，才能确保我们的产品始终具有竞争力。\r\n其次，我们实现了标准化和规模化的种植模式。从整地翻地到施肥灌溉，每一个环节我们都制定了严格的标准，确保每一个环节都能够达到最佳的效果。同时，我们还采用了机械化的生产方式，大大提高了生产效率，降低了生产成本。\r\n在数字化和智能化方面，我们也进行了积极的探索和实践。我们引入先进的农业物联网技术，实时监测土壤湿度、温度等关键参数，为精准灌溉、施肥提供数据支持，从而更好地掌握农田状况，为精准农业提供了有力的支持。','长三角自媒体联盟','2024-12-21 16:19:05.000000','农业','../images/detail11.jpg'),(11,'秦岭脚下，“忙碌劲儿”里感受农业发展的活力','冬日秦岭，群山苍劲。山脚下，气温已逼近零摄氏度，原本正是冬闲时节，但寒冬里的“忙碌劲儿”却随处可感。\n忙完葡萄园里的活，西安市长安区农民王卫花暂时还闲不下来。放下碗筷、拎起包，她着急去参加一场培训。\n培训地点位于长安区的乡村振兴学院，培训内容围绕前沿农业科技、农文旅融合发展展开。王卫花和学员们听得认真，不时记下要点。\n位于秦岭脚下的长安区是典型的“半城半农”格局，为加快乡村振兴步伐，近年来，当地先后开办了多期青年人才培训班，而挂牌不久的乡村振兴学院是当地促进农业人才振兴的又一抓手。\n王卫花是长安区职业农民协会会长，也是高级职业农民。这些年，通过不间断的培训、学习，她家的葡萄从单一品种发展到现在的30多个品种。因为种得好、销售旺，她还被当地老乡赞誉为“葡萄花”。\n“如果不接受新知识、不参加培训，就很难跟上农业发展的节奏。”务农多年的王卫花说，“现在，只要有培训我就去，没时间挤时间也要去！”\n一边是不断上新的农业技术，另一边是农户们担忧自己的知识短板。记者走访发现，为了进一步自我提升，利用难得的冬闲时节，抓紧时间参加培训、拜访农业专家、参加农业展会等成了不少农户冬日“充电”的主要选择。\n老乡的迫切需求，也是地方政府部门的重点供给。长安区相关负责人介绍，近年来，从田间课堂、农民夜校，到组织出省学习、出国考察，再到开办乡村振兴学院，目的就是希望能进一步整合和打通各个部门的资源，然后精准对接给广大农户，培养出更多懂技术、善经营、会管理的乡村带头人，让他们成为乡村振兴的催化剂，为农业添活力、助老乡更富裕。\n记者观察发现，近年来，秦岭北麓的西安农业区县采取多重方式，加大对当地农户和返乡青年的培训力度，一大批和王卫花一样的新农人脱颖而出，成为远近闻名的致富带头人。\n在西安市鄠邑区，一批“回乡创客”将乡土风情融入时尚生活，碰撞出别样的火花，引来游客竞相打卡；在蓝田县，一批“乡村主理人”回村发展，带领当地老乡售卖荞麦咖啡、创办乡村音乐会，沉寂的乡村变得活力满满；在周至县，技能培训催生出农业经纪人、市场分析员、植物造型师等新职业，受到市场欢迎……\n西安市农业农村局相关负责人介绍，目前，西安市已经探索形成“分层次、分类别、分产业”和“课堂集中学习+田间实操演练+优秀企业参访”的“3+3”培训模式，为乡村振兴提供了有力的人才支撑，一大批农业人才活跃在田间地头。\n得益于高素质农民队伍不断优化，秦岭脚下的农文旅融合发展步伐加快。从种植水稻、办民宿，到打造农业景区，经常参与各种培训的长安区农民高涛说：“我总能在这些培训课上受到启发，这帮助我的农业之路越走越宽。”','张静','2024-12-11 10:45:05.000000','农业','../images/detail12.jpg'),(12,'2025年全国硕士研究生招生考试各项工作准备就绪','央视网消息：据教育部网站消息，2025年全国硕士研究生招生考试将于2024年12月21日至22日举行。教育部会同中央宣传部、中央网信办、中央保密办、工业和信息化部、公安部等国家教育统一考试工作部际联席会议成员单位，召开研考安全工作视频会议、印发专项工作文件，进行全面动员部署，联合开展综合治理考试环境专项行动，严守考试安全、公平底线；严肃考风考纪，强化人防、物防、技防相结合，大力推动考场综合安防体系建设；加强协调调度，指导各地全面排查整治考试组织安全隐患和薄弱环节、完善应急预案、优化考生服务，全力实现平安研考。各省（区、市）党委政府高度重视研考组织工作，加强组织领导，周密部署检查；教育部门积极会同各有关部门齐抓共管、协调联动，强化安全责任落实。目前，全国研考各项工作准备就绪。','陈诗文 ','2024-12-20 09:59:55.000000','教育','../images/detail1.png');
/*!40000 ALTER TABLE `newsdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-24  8:56:28
