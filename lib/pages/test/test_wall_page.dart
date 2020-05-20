import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class TestWallPage extends StatefulWidget {

  @override
  _TestWallPageState createState()=> _TestWallPageState();
}

class _TestWallPageState extends State<TestWallPage> {
  List<String> wallpapersList =[
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_Twist_SS20_2_DI3.jpg?wid=1024&hei=576',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB-soft-trunk-%E7%B3%BB%E5%88%97%E6%89%8B%E8%A2%8B--HP_China_Men_business_DII.jpg?wid=1024&hei=1165',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_Tambour_DI1.jpg',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_1A4VT2_DI1.jpg?wid=480&hei=223',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_1A4VT2_DI1.jpg?wid=480&hei=223',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB-soft-trunk-%E7%B3%BB%E5%88%97%E6%89%8B%E8%A2%8B--HP_China_Men_business_DII.jpg?wid=1024&hei=1165',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_Tambour_DI1.jpg',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_1A4VT2_DI1.jpg?wid=480&hei=223',
    'https://www.louisvuitton.cn/images/is/image/lv/1/PP_VP_L/%E8%B7%AF%E6%98%93%E5%A8%81%E7%99%BB--HP_China_1A4VT2_DI1.jpg?wid=480&hei=223'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestWallPage'),
      ),
      body: wallpapersList!=null ? Container(
        child: StaggeredGridView.countBuilder(
          primary: false,
          padding: EdgeInsets.all(8.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          crossAxisCount: 4,
          itemCount: wallpapersList.length,
          itemBuilder: (context, index) {
            return Material(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Card(
                child: new Column(
                  children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        //new Center(child: new CircularProgressIndicator()),
                        new Center(
                          child: Image.network(wallpapersList[index], width: double.infinity)
                        ),
                      ],
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: new Column(
                        children: <Widget>[
                          new Text(
                            'Image number $index',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            'Width: ${222}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                          new Text(
                            'Height: ${121}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
            
            // return Material(
            //   elevation: 8.0,
            //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
            //   child: InkWell(
            //     child: Image.network(wallpapersList[index], width: 200, height: 100,),
            //   ),
            // );
          }, 
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2)
        ),
      ):Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}