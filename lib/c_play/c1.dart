import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peer_relationship_chart/a_main/a1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:peer_relationship_chart/widjets/child_management.dart';
import 'package:peer_relationship_chart/widjets/letterbox_size.dart';
import 'package:peer_relationship_chart/widjets/menu_bar.dart';
import 'package:widget_mask/widget_mask.dart';
import 'package:provider/provider.dart';


class C1 extends StatefulWidget {
  const C1({Key? key}) : super(key: key);

  @override
  State<C1> createState() => _C1State();
}

class _C1State extends State<C1> {

  @override
  Widget build(BuildContext context) {
    String sdfasdf = context.watch<ChildManagement>().childInfos[1].name;

    var akakak = context.watch<ChildManagement>().childInfos[1].childFace;
    //var _image = Base64Decoder(context.watch<ChildManagement>().childInfos[1].childFace);
    final UriData? _data = Uri.parse(akakak.toString()).data;
    final myImage = _data!.contentAsBytes();

    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/backgrounds/main_page.png'),
            )),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                child: Row(
                  children: [
                    Text(sdfasdf),
                    Image.memory(myImage ),


                  ],
                ),
              ),
            )
        )
    );
  }
}
