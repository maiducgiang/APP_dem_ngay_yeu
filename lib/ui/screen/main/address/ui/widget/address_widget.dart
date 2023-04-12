import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_cubit.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/checkbox/checkbox_widget.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:provider/src/provider.dart';

class AddressWidget extends StatelessWidget {
  final bool isSelect;
  final AddressDataResponse addressData;
  const AddressWidget(
      {Key? key, this.isSelect = false, required this.addressData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(kDefaultPaddingWidthWidget),
      margin: EdgeInsets.only(bottom: kDefaultPaddingHeight),
      decoration: BoxDecoration(
          color: isSelect ? primaryColor5 : secondaryColor25,
          border: isSelect ? Border.all(color: primaryColor) : null,
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddingWidthWidget),
            child: CheckboxWidget(
              isSelect: isSelect,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      addressData.fullName,
                      style: titleStyle,
                    ),
                    addressData.isDefault
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(2)),
                            child: Center(
                                child: Text(
                              'Địa chỉ mặc định',
                              style: buttonSmallTitleStyle,
                            )),
                          )
                        : Container(),
                  ],
                ),
                Text(addressData.phone,
                    style: subTitleStyle.copyWith(
                        height: 1.5, color: Colors.black)),
                Text(
                  addressData.fullAddress,
                  style: subTitleStyle.copyWith(height: 1.5),
                ),
                SizedBox(
                  height: kDefaultPaddingHeightScreen,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton.noBorder(
                          onPressed: () {
                            context
                                .read<AddressCubit>()
                                .deleteAddress(id: addressData.id);
                          },
                          label: 'XOÁ',
                          paddingHeight: 8.h,
                          backgroundColor: Colors.red.shade500,
                          style: const TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: kDefaultPaddingWidthScreen,
                    ),
                    Expanded(
                      child: PrimaryButton.noBorder(
                          onPressed: () {
                            context.router.push(NewAddressPage(
                                addressData: addressData,
                                isUpdate: true,
                                onBack: (AddressDataResponse addressData,
                                    bool isUpdate) async {
                                  isUpdate
                                      ? await context
                                          .read<AddressCubit>()
                                          .updateListAddressWhenUpdate(
                                              addressData: addressData)
                                      : null;
                                }));
                          },
                          label: 'CẬP NHẬT',
                          paddingHeight: 8.h,
                          backgroundColor:
                              isSelect ? Colors.white : secondaryColor60,
                          style: const TextStyle(color: contentColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
