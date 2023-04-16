import 'dart:io';
import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/ui/screen/home_page/cubit/home_page_cubit.dart';
import 'package:mubaha/ui/screen/home_page/widgets/add_day.dart';
import 'package:mubaha/ui/screen/home_page/widgets/count_circle.dart';
import 'package:mubaha/ui/screen/home_page/widgets/home_footer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late final HomePageCubit _homePageCubit;
  ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    _homePageCubit = context.read<HomePageCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics:
            const NeverScrollableScrollPhysics(parent: ClampingScrollPhysics()),
        child: Screenshot(
          controller: _screenshotController,
          child: ValueListenableBuilder<Box<dynamic>>(
              valueListenable: CacheManager.instance.cacheBox.listenable(),
              builder: (context, box, widget) {
                return Container(
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: (((box.get('background_img')) == null ||
                          (box.get('background_img')).isEmpty))
                      ? const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFDDDD),
                                Color(0xFFFDB1B1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        )
                      : BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(box.get('background_img')))),
                  child: Column(
                    children: [
                      HomeHeader(
                        onTapSaveImage: () async {
                          Navigator.pop(context);
                          Uint8List? image =
                              await _screenshotController.capture();
                          if (image != null) {
                            final directory = await getTemporaryDirectory();
                            final file = File('${directory.path}/image.png');
                            await file.writeAsBytes(image);
                            await ImageGallerySaver.saveFile(file.path);
                            BotToast.showText(text: 'Đã lưu hình ảnh');
                          }
                        },
                      ),
                      const CountCircle(),
                      const AddDay(),
                      const HomeFooter(),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
