import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/cache_manager.dart';

class EditPopup extends StatefulWidget {
  final String? title;
  final String? hint;
  final Function()? onTapCancel;
  final Function()? onTapSave;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  final bool chooseGender;
  final bool chooseMyGender;
  const EditPopup(
      {Key? key,
      this.title,
      this.hint,
      this.onTapCancel,
      this.onTapSave,
      this.textEditingController,
      this.onChanged,
      this.chooseGender = false,
      this.chooseMyGender = true})
      : super(key: key);

  @override
  State<EditPopup> createState() => _EditPopupState();
}

class _EditPopupState extends State<EditPopup> {
  late int genderValue;

  @override
  void initState() {
    genderValue =
      widget.chooseMyGender?
        CacheManager.instance.cacheBox.get('my_gender') ?? 0:
        CacheManager.instance.cacheBox.get('my_lover_gender') ?? 1;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 20.h, bottom: 30.h),
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title ?? 'Tiêu để',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 17),
                ),
                SizedBox(height: 27.h),
                widget.chooseGender
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 44),
                        child: Row(
                          children: [
                            Checkbox(
                                value: genderValue == 0,
                                checkColor: Colors.white,
                                shape: const CircleBorder(),
                                activeColor: const Color(0xFFFF8686),
                                onChanged: (value) {
                                  setState(() {
                                    (value ?? true)
                                        ? genderValue = 0
                                        : genderValue = 1;
                                    CacheManager.instance.cacheBox.put(
                                      widget.chooseMyGender ?
                                        'my_gender' : 'my_lover_gender',
                                        genderValue
                                    );
                                  });
                                }),
                            const Text('Nam'),
                            const Spacer(),
                            Checkbox(
                                value: genderValue == 1,
                                checkColor: Colors.white,
                                shape: const CircleBorder(),
                                activeColor: const Color(0xFFFF8686),
                                onChanged: (value) {
                                  setState(() {
                                    (value ?? true)
                                        ? genderValue = 1
                                        : genderValue = 0;
                                     CacheManager.instance.cacheBox.put(
                                      widget.chooseMyGender ?
                                        'my_gender' : 'my_lover_gender',
                                        genderValue
                                    );
                                  });
                                }),
                            const Text('Nữ'),
                          ],
                        ),
                      )
                    : TextField(
                        textAlign: TextAlign.center,
                        controller: widget.textEditingController,
                        keyboardType: TextInputType.text,
                        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          hintText: widget.hint,
                          hintStyle: TextStyle(fontSize: 11.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 15, right: 15, top: 10),
                          fillColor: const Color(0xFFF7F9FD),
                        ),
                      ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.onTapCancel ??
                            () {
                              Navigator.pop(context);
                            },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF8686),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'Huỷ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.onTapSave,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFF0F0),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text(
                              'Lưu',
                              style: TextStyle(
                                  color: Color(0xFFFF8686),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
