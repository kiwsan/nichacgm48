import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nichacgm48/constants/globals.dart';
import 'package:nichacgm48/styles/text_styles.dart';
import 'package:nichacgm48/ui/widgets/appbar_widget.dart';
import 'package:nichacgm48/utils/read_more_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(Constants.LayoutPadding2),
          right: ScreenUtil().setWidth(Constants.LayoutPadding2),
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(35),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setSp(10)),
              child: Text(
                "All project for #NichaCGM48",
                style: valueTextStyle,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            InkWell(
                child: CustomCard(
                  imageUrl:
                      "https://instagram.fbkk22-3.fna.fbcdn.net/v/t51.2885-15/e35/s1080x1080/91579376_2549133458673926_5466221338395953106_n.jpg?_nc_ht=instagram.fbkk22-3.fna.fbcdn.net&_nc_cat=102&_nc_ohc=Fq6pPTmnJKcAX_726PS&oh=932352168c0d708b25c7e98577f6f1db&oe=5EDE7FC4",
                  description: """TouchByHeart หัวใจใกล้กัน cover by NICHA CGM48

#TouchByHeart #หัวใจใกล้กัน ฝากเสียงเพลงส่งไปแทนความคิดถึงของณิชานะคะ 💛
•
ณิชามีความตั้งใจที่จะทำเพลงนี้ให้ทุกคนฟังมากๆเลยนะคะ 🥺
•
ขอขอบพระคุณ คุณครูทุกท่านนะคะ หนูจะน้อมรับทุกคำชี้แนะ และจะนำไปพัฒนาให้ดีขึ้นไปเรื่อยๆเลยค่า 🙏🏻🙏🏻
•
#BNK48 #CGM48 #NichaCGM48 #คุณทานตะวันของณิชาน่ารักขนาด""",
                ),
                onTap: () async {
                  /*const fallbackUrl =
                      'https://www.instagram.com/p/B-i2BZ3HzWn/';

                  await launch(fallbackUrl, forceSafariVC: false);*/
                }),
            InkWell(
                child: CustomCard(
                    imageUrl:
                        "https://instagram.fbkk22-1.fna.fbcdn.net/v/t51.2885-15/e35/84451869_201269761059132_3557874501554935537_n.jpg?_nc_ht=instagram.fbkk22-1.fna.fbcdn.net&_nc_cat=100&_nc_ohc=29MzJzACw7gAX9F1hge&oh=c5c57bc5cae6e63dc42f781fa0703b94&oe=5EDF21EA",
                    description: """ฮัลโหลลลลล๊ *〰️*
~
ทุกคน ดูวิดีโอของณิชากันหรือยังจ๊ะ ถ้าใครยังไม่ได้ดูก็รีบดูเลยนะ ~
รู้ป่ะทำไมต้องดู ?
~
เพราะว่า ว่า ว่า ณิชา ชา ชา อยากจะให้ทุกคนดูไง 😏 ~
ขอฝากณิชา CGM48 ด้วยนะคะ 💛
~
#CGM48 #NichaCGM48 #N26withTHESUN"""),
                onTap: () async {})
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String description;

  const CustomCard(
      {Key key, @required this.imageUrl, @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Image.network(imageUrl),
          Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/instagram_icon.png",
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setHeight(40),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                        child: Text(
                          "Official project on Instagram",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(30),
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  ReadMoreText(
                    description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(35),
                        fontWeight: FontWeight.normal),
                    trimLength: 50,
                    colorClickableText: Colors.amber,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
