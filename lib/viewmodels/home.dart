class BannerItem{
  String  id;
  String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  //扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.fromJSON(Map<String,dynamic> json){
    return BannerItem(id: json["id"] ?? "", imgUrl:json["imgUrl"] ?? "");
  }
}
// {
//             "id": "1181622001",
//             "name": "气质女装",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
//             "children": [
//                 {
//                     "id": "1191110001",
//                     "name": "半裙",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110002",
//                     "name": "衬衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110022",
//                     "name": "T恤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110023",
//                     "name": "针织衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110024",
//                     "name": "夹克",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110025",
//                     "name": "卫衣",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110028",
//                     "name": "背心",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         }
//flutter 必须强制转化 没有隐私转化
//根据json编写class对象和工厂转化函数
class CategoryItem{
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id,required this.name,required this.picture,this.children});
  //扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory CategoryItem.fromJSON(Map<String,dynamic> json){
    return CategoryItem(
      id: json["id"] ?? "", 
      name:json["name"] ?? "", 
      picture:json["picture"] ?? "", 
      children: json["children"] == null ? null : (json["children"] as List)
      .map((item)=>CategoryItem.fromJSON(item as Map<String,dynamic>)).toList(),
      );
  }
}
// {
//     "code": "1",
//     "msg": "操作成功",
//     "result": {
//         "id": "897682543",
//         "title": "特惠推荐",
//         "subTypes": [
//             {
//                 "id": "912000341",
//                 "title": "抢先尝鲜",
//                 "goodsItems": {
//                     "counts": 459,
//                     "pageSize": 10,
//                     "pages": 46,
//                     "page": 1,
//                     "items": [
//                         {
//                             "id": "1750713979950333956",
//                             "name": "Balva 日本制高级时尚太阳镜 方框",
//                             "desc": "抵挡99%紫外线太阳镜",
//                             "price": "1213.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235220/p5.png",
//                             "orderNum": 17
//                         },
//                         {
//                             "id": "1750713979895808015",
//                             "name": "COGIT UV休闲百搭牛仔帽 深蓝色",
//                             "desc": "不压发型 清凉舒适",
//                             "price": "116.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250541/p3.png",
//                             "orderNum": 18
//                         },
//                         {
//                             "id": "1750713979900002316",
//                             "name": "CA4LA AKA SIX CHECK TRAPPER HAT ORANGE ONESIZE 货号:MOR00097",
//                             "desc": "暖色格调飞行帽",
//                             "price": "1809.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254345/p1.png",
//                             "orderNum": 10
//                         },
//                         {
//                             "id": "1750713979652538372",
//                             "name": "ROOTOTE DELI 个性时尚大容量手提包 黑色豹纹",
//                             "desc": "大容量实用手提包",
//                             "price": "298.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250011/p5.png",
//                             "orderNum": 13
//                         },
//                         {
//                             "id": "1750713979929362433",
//                             "name": "手袋动物园 防寒保暖可爱动物手套 咖色小熊",
//                             "desc": "两用保暖动物小手套",
//                             "price": "198.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/238258/p1.png",
//                             "orderNum": 13
//                         },
//                         {
//                             "id": "1750713979203747840",
//                             "name": "CU2 舒适减负背包 紫色",
//                             "desc": "舒适轻松实现大容量出行",
//                             "price": "2419.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/255004/p1.png",
//                             "orderNum": 25
//                         },
//                         {
//                             "id": "1750713979900002312",
//                             "name": "kaorinomori 毛边针织条带帽Bebe黑色 56cm～58cm(97)",
//                             "desc": "秋冬必备萌系帽",
//                             "price": "537.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/256104/p9.png",
//                             "orderNum": 9
//                         },
//                         {
//                             "id": "1750713979900002317",
//                             "name": "CA4LA CHARI3 CHARCOAL GRAY ONESIZE 货号:TAM02605",
//                             "desc": "温暖实用，型格百搭",
//                             "price": "787.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254354/p1.png",
//                             "orderNum": 8
//                         },
//                         {
//                             "id": "1750713979925168129",
//                             "name": "KNITTING INN 羊毛毛毡格纹围巾 赤褐色",
//                             "desc": "厚实柔软有弹性",
//                             "price": "1019.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/42590/p1.png",
//                             "orderNum": 15
//                         },
//                         {
//                             "id": "1379052170040578049",
//                             "name": "极光限定 珠光蓝珐琅锅",
//                             "desc": null,
//                             "price": "199.00",
//                             "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//                             "orderNum": 929
//                         }
//                     ]
//                 }
//             },
//             {
//                 "id": "912000342",
//                 "title": "新品预告",
//                 "goodsItems": {
//                     "counts": 459,
//                     "pageSize": 10,
//                     "pages": 46,
//                     "page": 1,
//                     "items": [
//                         {
//                             "id": "1750713979900002312",
//                             "name": "kaorinomori 毛边针织条带帽Bebe黑色 56cm～58cm(97)",
//                             "desc": "秋冬必备萌系帽",
//                             "price": "537.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/256104/p9.png",
//                             "orderNum": 9
//                         },
//                         {
//                             "id": "1750713979929362433",
//                             "name": "手袋动物园 防寒保暖可爱动物手套 咖色小熊",
//                             "desc": "两用保暖动物小手套",
//                             "price": "198.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/238258/p1.png",
//                             "orderNum": 13
//                         },
//                         {
//                             "id": "1750713979950333956",
//                             "name": "Balva 日本制高级时尚太阳镜 方框",
//                             "desc": "抵挡99%紫外线太阳镜",
//                             "price": "1213.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235220/p5.png",
//                             "orderNum": 17
//                         },
//                         {
//                             "id": "1750713979900002316",
//                             "name": "CA4LA AKA SIX CHECK TRAPPER HAT ORANGE ONESIZE 货号:MOR00097",
//                             "desc": "暖色格调飞行帽",
//                             "price": "1809.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254345/p1.png",
//                             "orderNum": 10
//                         },
//                         {
//                             "id": "1750713979925168129",
//                             "name": "KNITTING INN 羊毛毛毡格纹围巾 赤褐色",
//                             "desc": "厚实柔软有弹性",
//                             "price": "1019.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/42590/p1.png",
//                             "orderNum": 15
//                         },
//                         {
//                             "id": "1379052170040578049",
//                             "name": "极光限定 珠光蓝珐琅锅",
//                             "desc": null,
//                             "price": "199.00",
//                             "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//                             "orderNum": 929
//                         },
//                         {
//                             "id": "1750713979895808015",
//                             "name": "COGIT UV休闲百搭牛仔帽 深蓝色",
//                             "desc": "不压发型 清凉舒适",
//                             "price": "116.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250541/p3.png",
//                             "orderNum": 18
//                         },
//                         {
//                             "id": "1750713979652538372",
//                             "name": "ROOTOTE DELI 个性时尚大容量手提包 黑色豹纹",
//                             "desc": "大容量实用手提包",
//                             "price": "298.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/250011/p5.png",
//                             "orderNum": 13
//                         },
//                         {
//                             "id": "1750713979900002317",
//                             "name": "CA4LA CHARI3 CHARCOAL GRAY ONESIZE 货号:TAM02605",
//                             "desc": "温暖实用，型格百搭",
//                             "price": "787.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254354/p1.png",
//                             "orderNum": 8
//                         },
//                         {
//                             "id": "1750713979203747840",
//                             "name": "CU2 舒适减负背包 紫色",
//                             "desc": "舒适轻松实现大容量出行",
//                             "price": "2419.00",
//                             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/255004/p1.png",
//                             "orderNum": 25
//                         }
//                     ]
//                 }
//             }
//         ]
//     }
// }
// 单个商品条目
class GoodsItem {
  final String id;
  final String name;
  final String desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"] ?? "",       // 注意这里 JSON 里 desc 可能是 null
      price: json["price"] ?? "",     // 价格先用 String 存，展示时再转
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

// 商品分页数据（goodsItems 这一层）
class GoodsPage {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsPage({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsPage.fromJSON(Map<String, dynamic> json) {
    return GoodsPage(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List? ?? [])
          .map((e) => GoodsItem.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// 子分类（抢先尝鲜 / 新品预告）
class HomeSubType {
  final String id;
  final String title;
  final GoodsPage goodsItems;

  HomeSubType({required this.id, required this.title, required this.goodsItems});

  factory HomeSubType.fromJSON(Map<String, dynamic> json) {
    return HomeSubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsPage.fromJSON(json["goodsItems"] as Map<String, dynamic>),
    );
  }
}

// 特惠推荐结果（result 这一层）
class HomeRecommend {
  final String id;
  final String title;
  final List<HomeSubType> subTypes;

  HomeRecommend({required this.id, required this.title, required this.subTypes});

  factory HomeRecommend.fromJSON(Map<String, dynamic> json) {
    return HomeRecommend(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map((e) => HomeSubType.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
//爆款推荐 一站买全
class SpecialRecommendResult{
  final String id;
  final String title;
  final List<HomeSubType> subTypes;

  SpecialRecommendResult({required this.id, required this.title, required this.subTypes});

  factory SpecialRecommendResult.fromJSON(Map<String, dynamic> json) {
    return SpecialRecommendResult(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map((e) => HomeSubType.fromJSON(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}