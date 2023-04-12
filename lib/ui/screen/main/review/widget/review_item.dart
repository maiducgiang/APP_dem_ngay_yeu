import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mubaha/data/model/cart/cart_model.dart';
import 'package:mubaha/ui/screen/main/review/widget/media_button_widget.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

class ReviewItem extends StatefulWidget {
  final CartDocs cartDocs;
  const ReviewItem({Key? key, required this.cartDocs}) : super(key: key);

  @override
  State<ReviewItem> createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;
  List<XFile>? imageFileList = [];
  // _getFromGallery() async {
  // final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  // if (selectedImages!.isNotEmpty) {
  //   imageFileList!.addAll(selectedImages);
  // }
  // print("Image List Length:" + imageFileList!.length.toString());
  // setState(() {});
  // if (selectedImages != null) {
  //   setState(() {
  //     imageFile = File(pickedFile.path);
  //     imageList!.add(imageFile!);
  //   });
  // }
  handlePickImage(ImageSource source) async {
    // isLoadingUpdateImage(true);
    final permission =
        source == ImageSource.camera ? Permission.camera : Permission.photos;
    final permissionStatus = await permission.request();
    switch (permissionStatus) {
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
      // isNotPermission.value = true;
      // print("123");
      // return;
      case PermissionStatus.granted:
        // Do nothing
        break;
      case PermissionStatus.limited:
        break;
    }
    final image = await imagePicker.pickImage(source: source);
    if (image == null) {
      // isLoadingUpdateImage(false);
      return;
    }

    final fileExtension = p.extension(image.path).replaceAll('.', '');
    if (fileExtension != 'png' &&
        fileExtension != 'jpg' &&
        fileExtension != 'jpeg') {
      // getIt.get<IToast>().show(
      //     title: "định dạng ảnh không được hỗ trợ",
      //     message: "định dạng ảnh không được hỗ trợ",
      //     hasDismissButton: false,
      //     duration: const Duration(milliseconds: 1000));
      // isLoading(false);
    }
    // try {
    //   final generateImageUrlResponse = await _apiClient.generateImageUrl(
    //     GenerateAwsImageRequest(fileType: fileExtension),
    //   );
    //   final uploadResult = await _apiClient.uploadImage(
    //       generateImageUrlResponse.awsImage.uploadUrl!, File(image.path));
    //   if (uploadResult) {

    //   }
    // } on DioError catch (e) {
    //   final errorMessage = _apiClient.mapDioErrorToMessage(e);
    //   log(errorMessage);
    // }
    // }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // if (pickedFile != null) {
    //   setState(() {
    //     imageFile = File(pickedFile.path);
    //     imageList!.add(imageFile!);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWidget(
          isSmall: true,
        ),
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.cartDocs.product!.media.featuredImage,
              imageBuilder: (context, imageBuilder) => Container(
                margin:
                    EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
                height: 21.h,
                width: 21.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.sp),
                    image: DecorationImage(image: imageBuilder)),
              ),
            ),
            SizedBox(
              width: kDefaultPaddingWidthScreen,
            ),
            Expanded(
              child: Text(
                widget.cartDocs.product!.name,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: primaryColor,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          height: kDefaultPaddingHeightWidget,
        ),
        imageFileList!.isNotEmpty
            ? Container(
                height: 60.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageFileList!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 60.h,
                        child: Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              )
            : Row(
                children: [
                  MediaButtonWidget(
                      icon: Icons.photo,
                      title: 'Thêm hình ảnh',
                      onTap: () {
                        handlePickImage(ImageSource.gallery);
                        // _getFromGallery();
                      }),
                  SizedBox(
                    width: kDefaultPaddingWidthScreen,
                  ),
                  MediaButtonWidget(
                      icon: Icons.camera_alt_rounded,
                      title: 'Chụp ảnh',
                      onTap: () {
                        _getFromCamera();
                      })
                ],
              ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPaddingHeightWidget),
          child: TextField(
            style: subTitleStyle.copyWith(
                height: 1.3, color: titleColor, fontWeight: FontWeight.w300),
            maxLines: 7,
            decoration: InputDecoration(
                hintText:
                    'Hãy chia sẻ những điều bạn thích về sản phẩm này nhé.',
                hintStyle: subTitleStyle.copyWith(
                    height: 1.3, fontWeight: FontWeight.w300),
                fillColor: secondaryColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5.sp),
                )),
          ),
        ),
      ],
    );
  }
}
