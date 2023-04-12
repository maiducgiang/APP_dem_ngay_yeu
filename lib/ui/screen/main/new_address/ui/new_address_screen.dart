import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_cubit.dart';
import 'package:mubaha/ui/screen/main/address/cubit/location/location_cubit.dart';
import 'package:mubaha/ui/screen/main/address/cubit/location/location_state.dart';
import 'package:mubaha/ui/screen/main/new_address/ui/widget/select_address_widget.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/shared/widget/divider/divider_widget.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/shared/widget/textfield/primary_textfield.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class NewAddressScreen extends StatefulWidget {
  NewAddressScreen(
      {Key? key, this.onBack, this.addressData, this.isUpdate = false})
      : super(key: key);
  final Function(AddressDataResponse addressData, bool isUpdate)? onBack;
  final AddressDataResponse? addressData;
  final bool isUpdate;
  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _townController = TextEditingController();

  final TextEditingController _districtController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AddressDataResponse? addressData;
  late bool isDefault;

  @override
  void initState() {
    super.initState();
    addressData = widget.addressData;
    isDefault = addressData != null ? addressData!.isDefault : false;
    _nameController.text = addressData != null ? addressData!.fullName : '';
    _phoneController.text = addressData != null ? addressData!.phone : '';
    _streetController.text = addressData != null ? addressData!.details : '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocus(context),
      child: MultiBlocProvider(
        providers: [
          widget.isUpdate
              ? BlocProvider(
                  create: (context) =>
                      LocationCubit(getIt.get<CustomerRepository>())
                        ..getLocationProvinces(addressData: addressData)
                        ..getLocationDistricts(
                            provinceId: addressData!.codes.province,
                            addressData: addressData)
                        ..getLocationWards(
                            districtId: addressData!.codes.district,
                            addressData: addressData),
                )
              : BlocProvider(
                  create: (context) =>
                      LocationCubit(getIt.get<CustomerRepository>())
                        ..getLocationProvinces(),
                ),
          BlocProvider(
              create: (context) =>
                  AddressCubit(getIt.get<CustomerRepository>()))
        ],
        child: Scaffold(
          body: BlocConsumer<LocationCubit, LocationState>(
            listener: (contex, state) {},
            builder: (context, state) {
              if (state.isLoading ||
                  state.isLoadingDistrict == true ||
                  state.isLoadingWard == true) return const LoadingScreen();
              return SafeArea(
                  child: Column(
                children: [
                  Header(
                    title: widget.isUpdate ? 'Cập nhật địa chỉ' : 'Địa chỉ mới',
                    isBack: true,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthWidget),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: kDefaultPaddingHeightScreen,
                                ),
                                PrimaryTextField(
                                  isUsername: true,
                                  label: 'Họ và tên',
                                  controller: _nameController,
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                PrimaryTextField(
                                  isPhone: true,
                                  label: 'Số điện thoại',
                                  controller: _phoneController,
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                SelectAddressWidget(
                                  label: 'Tỉnh/Thành phố',
                                  addressData: addressData,
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                SelectAddressWidget(
                                  label: 'Quận/Huyện',
                                  isDistrict: true,
                                  addressData: addressData,
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                SelectAddressWidget(
                                  label: 'Phường/Xã/Thị trấn',
                                  isWard: true,
                                  addressData: addressData,
                                ),
                                SizedBox(
                                  height: kDefaultPaddingHeightWidget,
                                ),
                                PrimaryTextField(
                                  label: 'Tên đường, toà nhà, số nhà',
                                  controller: _streetController,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPaddingHeight,
                        ),
                        DividerWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthWidget),
                          child: Column(
                            children: [
                              // Heading(label: 'Loại địa chỉ'),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: const [
                              //     AddressTypeWidget(
                              //       title: 'Nhà riêng',
                              //       isSelect: true,
                              //     ),
                              //     AddressTypeWidget(title: 'Văn phòng'),
                              //     AddressTypeWidget(title: 'Khác'),
                              //   ],
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: kDefaultPaddingWidthWidget),
                                child: Row(
                                  children: [
                                    CheckboxWidget(
                                      onPress: () {
                                        setState(() {
                                          isDefault = !isDefault;
                                        });
                                      },
                                      isCircle: false,
                                      isSelect: isDefault,
                                    ),
                                    SizedBox(
                                      width: kDefaultPaddingWidthScreen,
                                    ),
                                    Text(
                                      'Đặt làm địa chỉ mặc định',
                                      style: titleStyle.copyWith(
                                          color: contentColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPaddingWidth),
                    child: PrimaryButton(
                      label: widget.isUpdate
                          ? 'Cập nhật địa chỉ'
                          : 'Thêm địa chỉ mới',
                      onPressed: () async {
                        unfocus(context);
                        if (_formKey.currentState!.validate() &&
                            state.district != null &&
                            state.province != null &&
                            state.ward != null) {
                          final addressResponse = widget.isUpdate
                              ? await context
                                  .read<AddressCubit>()
                                  .updateAddress(
                                      idAddress: addressData!.id,
                                      request: AddressRequest(
                                          detailAddress: _streetController.text,
                                          districtCode: state.district!.code,
                                          fullAddress: _streetController.text +
                                              ', ' +
                                              state.ward!.name +
                                              ', ' +
                                              state.district!.name +
                                              ', ' +
                                              state.province!.name,
                                          fullName: _nameController.text,
                                          phone: _phoneController.text,
                                          provinceCode: state.province!.code,
                                          wardCode: state.ward!.code,
                                          isDefault: isDefault))
                              : await context.read<AddressCubit>().addAddress(
                                  request: AddressRequest(
                                      detailAddress: _streetController.text,
                                      districtCode: state.district!.code,
                                      fullAddress: _streetController.text +
                                          ', ' +
                                          state.ward!.name +
                                          ', ' +
                                          state.district!.name +
                                          ', ' +
                                          state.province!.name,
                                      fullName: _nameController.text,
                                      phone: _phoneController.text,
                                      provinceCode: state.province!.code,
                                      wardCode: state.ward!.code,
                                      isDefault: isDefault));
                          widget.onBack!
                              .call(addressResponse!, widget.isUpdate);
                          context.router.pop();
                        }
                      },
                    ),
                  ),
                  // BaseBottom(
                  //   rightButton: 'HOÀN THÀNH',
                  //   enableLeftButton: _streetController.text.isNotEmpty &&
                  //       _nameController.text.isNotEmpty &&
                  //       _phoneController.text.isNotEmpty &&
                  //       state.district != null &&
                  //       state.ward != null &&
                  //       state.province != null,
                  //   onPressRight: () {
                  //     unfocus(context);
                  //     if (_formKey.currentState!.validate()) {
                  //       context.read<AddressCubit>().addAddress(
                  //           request: AddressRequest(
                  //               detailAddress: _streetController.text,
                  //               districtCode: state.district!.code,
                  //               fullAddress: 'demo',
                  //               fullName: _nameController.text,
                  //               phone: _phoneController.text,
                  //               provinceCode: state.province!.code,
                  //               wardCode: state.ward!.code));
                  //     }
                  //   },
                  //   leftButton: 'THIẾT LẬP LẠI',
                  //   onPressLeft: () {
                  //     context.read<LocationCubit>().emit(state.copyWith(
                  //         district: null, ward: null, province: null));
                  //   },
                  // )
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
