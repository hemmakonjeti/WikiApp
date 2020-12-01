import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/models/wiki_search_response.dart';
import 'package:flutter_demo_app/search_item_details.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class WikiSearchList extends StatefulWidget {
  @override
  _WikiSearchListState createState() => _WikiSearchListState();
}

class _WikiSearchListState extends State<WikiSearchList> {
  String url =
      "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=" +
          'sachin' +
          "+T&gpslimit=10";
  WikiSearchResponse searchResponse;
  bool isLoading = true, isWorking = true;

  @override
  void initState() {
    super.initState();

    //initHive();
    fetchData();
  }

  initHive() async {
    String path =
        await getApplicationSupportDirectory().then((dir) => dir.path);
    Hive.init(path);
    if (!Hive.isAdapterRegistered(0))
      Hive.registerAdapter(WikiSearchResponseAdapter());
    if (!Hive.isAdapterRegistered(1)) Hive.registerAdapter(QueryAdapter());
    if (!Hive.isAdapterRegistered(2)) Hive.registerAdapter(ResultPageAdapter());
    if (!Hive.isAdapterRegistered(3)) Hive.registerAdapter(TermsAdapter());
    if (!Hive.isAdapterRegistered(4)) Hive.registerAdapter(ThumbnailAdapter());
    if (!Hive.isAdapterRegistered(5)) Hive.registerAdapter(RedirectAdapter());
    if (!Hive.isAdapterRegistered(6)) Hive.registerAdapter(ContinueAdapter());
  }

  storeResponse() async {
    await initHive();
    var box = await Hive.openBox('wikiBox');
    box.put('response', searchResponse);
    print('Response stored!');
  }

  getResponse() async {
    await initHive();
    var box = await Hive.openBox('wikiBox');
    if (box.containsKey('response')) {
      print('Key is found!');
      searchResponse = await box.get('response');
      setState(() {
        isWorking = true;
        isLoading = false;
      });
    } else {
      print('Key not found!');
    }
  }

  getURL(String searchText) {
    return "https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=" +
        searchText +
        "+T&gpslimit=10";
  }

  fetchData() async {
    try {
      var response = await http.get(url);
      print('Response: ${response.body}');
      if (response.statusCode == 200 && response != null) {
        searchResponse =
            WikiSearchResponse.fromJson(json.decode(response.body));
        await storeResponse();
        setState(() {
          isLoading = false;
        });
      } else {
        print('Oops Something went wrong');
        setState(() {
          isWorking = false;
          // getResponse();
        });
      }
    } catch (e) {
      print('unable to connect!');
      getResponse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextField(
        onChanged: (text) {
          setState(() {
            url = getURL(text);

            fetchData();
          });
        },
      )),
      body: !isWorking
          ? Text('not working')
          : isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: searchResponse?.query?.pages?.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    ResultPage page =
                        searchResponse?.query?.pages?.elementAt(index);
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SearchItemDetails(
                                  name: page?.title,
                                  description: page?.terms != null
                                      ? page?.terms?.description[0] ?? 'N/A'
                                      : 'N/A',
                                  image: page?.thumbnail?.source,
                                ),
                              ),
                            );
                          },
                          dense: true,
                          leading: page?.thumbnail != null
                              ? Container(
                                  constraints:
                                      BoxConstraints.tight(Size.square(40)),
                                  child: CachedNetworkImage(
                                    imageUrl: page?.thumbnail?.source,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                ),
                          title: Text(
                            '${page?.title}',
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          ),
                          subtitle: Text(
                            '${page?.pageid}',
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
    );
  }
}
