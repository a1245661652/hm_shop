import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;

  HmSlider({Key? key,required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  CarouselSliderController  _controller = CarouselSliderController() ;
  int _currentIndex = 0 ;
  Widget _getSlider(){
    final double screenWidth  =  MediaQuery.of(context).size.width;
    //根据数据渲染的不同的轮播选项
    return  CarouselSlider(
      items:List.generate(
        widget.bannerList.length,
        (int index){
          return Image.network(widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth,);
        }), options: CarouselOptions(
          height: 300,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          onPageChanged: (index, reason) {
            _currentIndex = index ;
            setState(() {

            });
          },
        ),
        carouselController: _controller,);
  }
  Widget _getSearch(){
    return  Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Text("搜索...",style: TextStyle(color: Colors.white),),
      ),
      )
      );
  }
  Widget _getDots(){
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: 
            List.generate(widget.bannerList.length, (int index){
              return GestureDetector(
                onTap: () {
                  print(index);
                  _controller.animateToPage(index);
                },
                child: AnimatedContainer(
                  duration:Duration(milliseconds: 300),
                  height: 6,
                  width: index == _currentIndex ? 40:20,
                  decoration: BoxDecoration(
                    color:index == _currentIndex ?  Colors.white:Color.fromRGBO(0,0,0,0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
              
            }),
          
        ),
    )) ;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
        _getSearch(),
        _getDots()
      ],
    );
  }
}