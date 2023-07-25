import 'package:flutter/material.dart';


import 'package:flutter_project/data/data.dart';

import 'package:flutter_project/widgets/product_widget.dart';

import 'package:flutter_project/screens/details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  State<HomeScreen> createState() => _HomeScreenState();
}
const kPrimaryColor = Colors.red;


class _HomeScreenState extends State<HomeScreen> {
  final int itemsPerPage = 10; // 每页显示的项目数量
  int currentPage = 0; // 当前页数


  Widget build(BuildContext context) {
    final List<Product> products = data[0].products!; // 产品列表
    final int startIndex = currentPage * itemsPerPage; // 当前页的起始索引
    final int endIndex = startIndex + itemsPerPage; // 当前页的结束索引
    final List<Product> currentPageProducts = products.sublist(
      startIndex,
      endIndex.clamp(0, products.length), // 确保结束索引不超过产品列表长度
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30.0
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kPrimaryColor,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color:Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Frances",
                        style: TextStyle(
                            color:Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              // const SizedBox(height:10),
              // RichText (
              //   text: const TextSpan(
              //       children: [
              //         TextSpan (
              //             text:'Get your item \n',
              //             style: TextStyle(
              //                 fontSize: 30,
              //                 color: Colors.black87,
              //                 fontWeight: FontWeight.w400
              //             )
              //         ),
              //         TextSpan (
              //             text:'With',
              //             style: TextStyle(
              //                 fontSize: 30,
              //                 color: Colors.black87,
              //                 fontWeight: FontWeight.w400
              //             )
              //         ),
              //         TextSpan (
              //             text:'Hay Markets',
              //             style: TextStyle(
              //                 fontSize: 35,
              //                 color: Colors.black87,
              //                 fontWeight: FontWeight.w400
              //             )
              //         )
              //       ]
              //   )
              // )

              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.70,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // 阴影偏移量，向下偏移3个像素
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: kPrimaryColor,
                          size: 25,
                        ),
                        SizedBox(width:  15),
                        Text(
                          "Search pineapple",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.black38
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color:kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon (
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top:20.0),
                    itemBuilder: (context , index) {
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              color: index == 0 ? kPrimaryColor : Colors.black45,
                              fontWeight: index == 0 ? FontWeight.bold : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount:data[0].products!.length,
                  itemBuilder:(context,index) {
                    final product = currentPageProducts[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => DetailScreen(
                        //   product:data[0].products![index]
                        // ))

                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(product:data[0].products![index]),
                        ),
                      ),
                      child: ProductWidget(product:data[0].products![index]),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}