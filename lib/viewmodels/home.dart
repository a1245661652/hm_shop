class BannerItem{
  String  id;
  String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  //扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.formJSON(Map<String,dynamic> json){
    return BannerItem(id: json["id"] ?? "", imgUrl:json["imgUrl"] ?? "");
  }
}

//flutter 必须强制转化 没有隐私转化
