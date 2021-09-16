import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photogallery/picture_detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhotoGalleryApp(),
  ));
}

class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  //Images data source
  List img = [
    "https://images.unsplash.com/photo-1628873268744-c30c97e17917?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIxOXx4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1621858170710-2cadd3066b3a?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIwMnx4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1628394029816-1dc524670f60?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI0M3x4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612182062572-e29c5dfb5eb4?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMxNHx4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1508424897381-4fd8755e4b7a?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMyMHx4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1627492374805-e96724bdc562?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzNnx4alBSNGhsa0JHQXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Photo Gallery App",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent),
              ),
              SizedBox(height: 18.0),
              TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.amber,
                      ),
                      hintText: "Search Image",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)))),
              SizedBox(
                height: 24.0,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: img.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PictureDetailScreen(img[index])),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                img[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ));
                    },
                    staggeredTileBuilder: (index) {
                      return new StaggeredTile.count(1, index.isEven ? 1.2 : 2);
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
