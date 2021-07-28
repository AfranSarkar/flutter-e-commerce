import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.deep_orange,
            child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,color: Colors.white,)),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.deep_orange,
            child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.favorite_outline,color: Colors.white,)),
          )
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3.5,
              child: CarouselSlider(
                  items: widget._product['product-img']
                      .map<Widget>((item) => Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.fitWidth)),
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (val, carouselPageChangedReason) {
                        setState(() {

                        });
                      })),
            ),
            Text(widget._product['product-name']),
            Text(widget._product['product-description']),
            Text(widget._product['product-price'].toString()),
            SizedBox(
              width: 1.sw,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18.sp),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.deep_orange,
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
