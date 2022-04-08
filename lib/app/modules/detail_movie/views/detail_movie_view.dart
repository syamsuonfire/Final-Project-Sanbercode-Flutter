import 'package:finalproject_moviegames/app/modules/detail_movie/views/circular_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_movie_controller.dart';

class DetailMovieView extends GetView<DetailMovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => RefreshIndicator(
            onRefresh: controller.getRefreshData,
            child: controller.isDataLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -50.0, 0.0),
                            child: Hero(
                              tag: controller.data!["image_url"],
                              child: ClipShadowPath(
                                clipper: CircularClipper(),
                                shadow: Shadow(blurRadius: 20.0),
                                child: Image(
                                  height: 400.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      controller.data!["image_url"]),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.only(left: 30.0),
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back),
                                iconSize: 30.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 60,
                              )
                            ],
                          ),
                          Positioned.fill(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                elevation: 12.0,
                                onPressed: () => print('Play Video'),
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 60.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 20.0,
                            child: IconButton(
                              onPressed: () => print('Add to My List'),
                              icon: Icon(Icons.add),
                              iconSize: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 25.0,
                            child: IconButton(
                              onPressed: () => print('Share'),
                              icon: Icon(Icons.share),
                              iconSize: 35.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              controller.data!["title"],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              controller.data!["year"].toString(),
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 22.0),
                            Text(controller.data!["genre"]),
                            SizedBox(height: 22.0),
                            Text(
                              '⭐ ⭐ ⭐ ⭐',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(height: 25.0),
                            Container(
                              height: 120.0,
                              child: SingleChildScrollView(
                                child: Text(
                                  controller.data!["description"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
