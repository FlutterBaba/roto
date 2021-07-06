import 'dart:convert';
import 'dart:ui';

import 'package:boto/models/slider_model.dart';
import 'package:boto/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String image;
  final String model;
  final String descriptionEn;
  final String brande;
  final int price;
  final int view;
  final condistion;
  DetailPage({
    required this.descriptionEn,
    required this.model,
    required this.condistion,
    required this.image,
    required this.brande,
    required this.price,
    required this.view,
  });
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool buttonColor = true;
  var k;
  var intrand;
  var model;
  Widget buildSlideImage({required title}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      height: 300,
      width: MediaQuery.of(context).size.width / 1 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://boto.optimal.krd/${widget.image}"),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.5),
              // Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget buildSocialImage({required image, required title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Image.asset(
                "images/$image.png",
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget buildSimilarProduct(
      {required image, required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 300,
          width: 200,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Image.network(
                      "https://boto.optimal.krd/$image",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://www.pricerunner.com/product/1200x630/1868911647/Apple-Magic-Keyboard-(Danish).jpg",
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: [
                              // Colors.black87,
                              // Colors.black87,
                              Colors.black.withOpacity(1.0),
                              Colors.black.withOpacity(.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                minWidth: 150,
                height: 40,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red,
                onPressed: onPressed,
                child: Text(
                  "VIEW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<SliderModel>> fetchJobs() async {
    var productApi =
        "https://boto.optimal.krd/api/car?fbclid=IwAR0w3C3d6szqA3J93NF-TxNU23-Hqgdc3ed0v4g3MZc8grAlPAw_ql05T2I";
    var response = await http.get(
      Uri.parse(productApi),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      k = json.decode(response.body);

      return jsonResponse.map((job) => new SliderModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("yaqoob${widget.brande}");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "BoTo",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.light_mode_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildSlideImage(title: widget.brande),
                  buildSlideImage(title: widget.brande),
                  buildSlideImage(title: widget.brande),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(12.0),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "St Prsberg",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${widget.price}\$",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "St Prsberg",
                    style: TextStyle(
                      color: Color(0xff4A89DC),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 30),
                  Text(
                    widget.descriptionEn,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.price}\$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Model",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.model,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.brande,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Condistion",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      widget.condistion == 0
                          ? Text(
                              "new",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              "Used",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Realestate Tel",
                            style: TextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "4.9",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.view}\tviews",
                        style: TextStyle(
                          color: Color(0xff4A89DC),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Share with the Wold",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Share or Save for Later",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                context: context,
                                builder: (_) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pop(), // Closing the sheet.
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Share the Love",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Just Tap the Social Icon. We'll add the Link",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        buildSocialImage(
                                          image: "facebook",
                                          title: "Facebook",
                                        ),
                                        buildSocialImage(
                                          image: "twitter",
                                          title: "Twitter",
                                        ),
                                        buildSocialImage(
                                          image: "linkdin",
                                          title: "Linkedin",
                                        ),
                                        buildSocialImage(
                                          image: "whatsapp",
                                          title: "Whatsapp",
                                        ),
                                        buildSocialImage(
                                          image: "email",
                                          title: "Email",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.share),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                context: context,
                                builder: (_) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pop(), // Closing the sheet.
                                    child: ListView(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Share the Love",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Just Tap the Social Icon. We'll add the Link",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        buildSocialImage(
                                          image: "facebook",
                                          title: "Facebook",
                                        ),
                                        buildSocialImage(
                                          image: "twitter",
                                          title: "Twitter",
                                        ),
                                        buildSocialImage(
                                          image: "linkdin",
                                          title: "Linkedin",
                                        ),
                                        buildSocialImage(
                                          image: "whatsapp",
                                          title: "Whatsapp",
                                        ),
                                        buildSocialImage(
                                          image: "email",
                                          title: "Email",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(12),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    height: 60,
                    minWidth: 200,
                    elevation: 0,
                    color: buttonColor ? Colors.red : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "images",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        buttonColor = true;
                      });
                    },
                  ),
                  MaterialButton(
                    height: 60,
                    minWidth: 200,
                    elevation: 0,
                    color: buttonColor ? Colors.grey : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "Videos",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        buttonColor = false;
                      });
                    },
                  )
                ],
              ),
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: MaterialButton(
                height: 60,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xff8CC152),
                onPressed: () {},
                child: Text(
                  "PURCHASE TODAY",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(12.0),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "Similar",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "Products you may also like based on what yo're",
                      style: TextStyle(
                        color: Color(0xff6c6c6c),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      "currently looking at",
                      style: TextStyle(
                        color: Color(0xff6c6c6c),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List<SliderModel>>(
                      future: fetchJobs(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data!.map((element) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    buildSimilarProduct(
                                      onPressed: () async {
                                        k.forEach(
                                          (e) {
                                            if (e["brand"]["id"] ==
                                                element.id) {
                                              if (e["brand"]["id"] == null) {
                                              } else {
                                                intrand = e["brand"]["name"];
                                              }
                                            }
                                            if (e["mod"]["id"] ==
                                                element.modId) {
                                              if (e["mod"]["id"] == null) {
                                              } else {
                                                model = e["mod"]["name"];
                                              }
                                            }
                                          },
                                        );
                                        print(element.id);
                                        navigate(
                                          context: context,
                                          navigateTo: DetailPage(
                                            descriptionEn:
                                                element.descriptionEn,
                                            model: model.toString(),
                                            condistion: element.used,
                                            view: element.view,
                                            image: element.image,
                                            price: element.price,
                                            brande: intrand.toString(),
                                          ),
                                        );
                                      },
                                      image: element.image,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "StickyMobile",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Made With",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "by Enabled",
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Powerd by the best Mobile Website",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Developer on Envato Market Elite Quality Elite",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Products.",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff2363b6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "f",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff4A89DC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff6c6c6c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text("Copyright @ Enabled 2021, all Rights Reserved"),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 2,
                        color: Colors.grey,
                      ),
                      Text(
                        "Terms And Conditions",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 2,
                        color: Colors.grey,
                      ),
                      Text(
                        "Back to Tap",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
