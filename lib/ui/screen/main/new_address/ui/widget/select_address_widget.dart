import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/model/location/location_model.dart';
import 'package:mubaha/ui/screen/main/address/cubit/location/location_cubit.dart';
import 'package:mubaha/ui/screen/main/address/cubit/location/location_state.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/text_style.dart';

class SelectAddressWidget extends StatefulWidget {
  final String label;
  final bool isDistrict;
  final bool isWard;
  final bool enableSelect;
  final AddressDataResponse? addressData;
  const SelectAddressWidget(
      {Key? key,
      required this.label,
      this.isDistrict = false,
      this.isWard = false,
      this.enableSelect = false,
      this.addressData})
      : super(key: key);

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  late LocationCubit _locationCubit;
  int indexProvince = -1;
  int indexDistrict = -1;
  int indexWard = -1;
  AddressDataResponse? get addressData => widget.addressData;

  @override
  void initState() {
    _locationCubit = context.read<LocationCubit>();

    // final indexProvince = provinces
    //     .indexWhere((element) => element.code == addressData!.codes.province);
    // print(indexProvince);
    // addressData != null ? getProvice() : null;
    // addressData != null ? getDistrict() : null;
    // addressData != null ? getWard() : null;
    super.initState();
  }

  // void getProvice() async {
  //   final provinces = await _locationCubit.getLocationProvinces();
  //   final indexProvince = provinces
  //       .indexWhere((element) => element.code == addressData!.codes.province);
  //   _locationCubit.updateProvince(provinces[indexProvince]);
  // }

  // void getDistrict() async {
  //   final districts = await _locationCubit.getLocationDistricts(
  //       provinceId: addressData!.codes.province);
  //   final indexDistrict = districts
  //       .indexWhere((element) => element.code == addressData!.codes.district);
  //   _locationCubit.updateDistrict(districts[indexDistrict]);
  // }

  // void getWard() async {
  //   final wards = await _locationCubit.getLocationWards(
  //       districtId: addressData!.codes.district);
  //   final indexWard = wards
  //       .indexWhere((element) => element.code == addressData!.codes.district);
  //   _locationCubit.updateDistrict(wards[indexWard]);
  // }

  Widget setupAlertDialoadContainer(
      {required List<LocationData> provinces,
      List<LocationData>? districts,
      List<LocationData>? wards}) {
    return Container(
      height: 300.h,
      width: 300.w,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.isWard
            ? wards!.length
            : widget.isDistrict
                ? districts!.length
                : provinces.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
              onTap: () {
                widget.isDistrict
                    ? _locationCubit.getLocationWards(
                        districtId: districts![index].code)
                    : widget.isWard
                        ? null
                        : _locationCubit.getLocationDistricts(
                            provinceId: provinces[index].code,
                            isUpdateProvince: true);
                widget.isWard
                    ? setState(() {
                        indexWard = index;
                      })
                    : widget.isDistrict
                        ? setState(() {
                            indexDistrict = index;
                          })
                        : setState(() {
                            indexProvince = index;
                          });

                widget.isWard
                    ? _locationCubit.updateWard(wards![index])
                    : widget.isDistrict
                        ? _locationCubit.updateDistrict(districts![index])
                        : _locationCubit.updateProvince(provinces[index]);
                Navigator.pop(context);
              },
              child: Text(
                  widget.isWard
                      ? wards![index].name
                      : widget.isDistrict
                          ? districts![index].name
                          : provinces[index].name,
                  style: AppTextStyle().textBody.copyWith(
                        color: titleColor,
                      )),
            ),
          );
        },
      ),
    );
  }

  void _showDialog(
      {required List<LocationData> provinces,
      List<LocationData>? districts,
      List<LocationData>? wards}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.label),
            content: setupAlertDialoadContainer(
                provinces: provinces, districts: districts, wards: wards),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, locationState) {
        return GestureDetector(
            onTap: () {
              widget.isWard
                  ? locationState.wards != null
                      ? _showDialog(
                          provinces: locationState.provinces!,
                          districts: locationState.districts,
                          wards: locationState.wards)
                      : null
                  : widget.isDistrict
                      ? locationState.districts != null
                          ? _showDialog(
                              provinces: locationState.provinces!,
                              districts: locationState.districts,
                              wards: locationState.wards)
                          : null
                      : _showDialog(
                          provinces: locationState.provinces!,
                          districts: locationState.districts,
                          wards: locationState.wards);
            },
            child: Container(
              child: FormField(
                validator: (_) {
                  return widget.isWard
                      ? locationState.ward == null
                          ? 'Vui lòng chọn Phường/Xã/Thị trấn'
                          : null
                      : widget.isDistrict
                          ? locationState.district == null
                              ? 'Vui lòng chọn Quận/Huyện'
                              : null
                          : locationState.province == null
                              ? 'Vui lòng chọn Tỉnh/Thành phố'
                              : null;
                },
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        fontSize: 10,
                      ),
                      labelText: widget.label,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: AppTextStyle().textBody,
                      floatingLabelStyle: AppTextStyle().textBody.copyWith(
                            color: widget.isWard
                                ? locationState.wards != null && indexWard != -1
                                    ? primaryColor
                                    : locationState.ward != null
                                        ? primaryColor
                                        : Colors.grey
                                : widget.isDistrict
                                    ? locationState.districts != null &&
                                            indexDistrict != -1
                                        ? primaryColor
                                        : locationState.district != null
                                            ? primaryColor
                                            : Colors.grey
                                    : indexProvince != -1
                                        ? primaryColor
                                        : locationState.province != null
                                            ? primaryColor
                                            : Colors.grey,
                          ),
                      errorText: state.errorText,
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsets.only(
                          top: 0, bottom: 0, left: 20.w, right: 0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: borderColor),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text(
                        widget.isWard
                            ? locationState.wards != null && indexWard != -1
                                ? locationState.wards![indexWard].name
                                : locationState.ward != null
                                    ? locationState.ward!.name
                                    : 'Chọn Phường/Xã/Thị trấn'
                            : widget.isDistrict
                                ? locationState.districts != null &&
                                        indexDistrict != -1
                                    ? locationState
                                        .districts![indexDistrict].name
                                    : locationState.district != null
                                        ? locationState.district!.name
                                        : 'Chọn Quận/Huyện'
                                : locationState.province != null
                                    ? locationState.province!.name
                                    : indexProvince != -1
                                        ? locationState
                                            .provinces![indexProvince].name
                                        : 'Chọn Tỉnh/Thành phố',
                        style: AppTextStyle().textBody.copyWith(
                            color: widget.isWard
                                ? locationState.wards != null
                                    ? titleColor
                                    : borderColor
                                : widget.isDistrict
                                    ? locationState.districts != null
                                        ? titleColor
                                        : borderColor
                                    : titleColor)),
                  );
                },
              ),
            ));
      },
    );
  }
}
