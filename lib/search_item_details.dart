import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchItemDetails extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const SearchItemDetails({this.name, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.teal,
        ),
        child: Text(
          'Share',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      appBar: AppBar(
        // title: Text('$name'),
        title: Text('Details Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* Container(
              height: MediaQuery.of(context).size.height / 3,
              child: image != null ? Image.network(image) : Container(),
            ),*/
            Container(
              height: MediaQuery.of(context).size.height / 4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
              ),
              child: image == null
                  ? CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                    )
                  : CircleAvatar(
                      radius: 40,
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Name: $name',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              alignment: Alignment.center,
              child: Text(
                'Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              alignment: Alignment.centerLeft,
              child: Text('$description'),
            ),
          ],
        ),
      ),
    );
  }
}
