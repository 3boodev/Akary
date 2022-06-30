import 'package:akary/constants/theme.dart';
import 'package:akary/presentation/widgets/adaptive/textutils.dart';
import 'package:akary/presentation/widgets/auth/formfield.dart';
import 'package:akary/presentation/widgets/main/addakaroption.dart';
import 'package:akary/presentation/widgets/main/akarlocation.dart';
import 'package:akary/presentation/widgets/main/selectimage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constants/const.dart';

class AddNewAkar extends StatelessWidget {
  AddNewAkar({Key? key}) : super(key: key);
  var akarnameController = TextEditingController();
  var areaController = TextEditingController();
  var detailsController = TextEditingController();
  var addressController = TextEditingController();
  var roomsController = TextEditingController();
  var kitchenController = TextEditingController();
  var pathsController = TextEditingController();
  var priceController = TextEditingController();
  var phoneNum = "";
  var CountryCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: GetStorage().read('isDarkTheme') == true
            ? Colors.black45
            : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: GetStorage().read('isDarkTheme') == true
                ? Colors.white
                : mainColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TextUtils(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      text: 'Add New 3Kar',
                      color: GetStorage().read('isDarkTheme') == true
                          ? Colors.white
                          : mainColor,
                      underLine: TextDecoration.none),
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: akarnameController,
                    type: TextInputType.text,
                    validate: (value) {},
                    label: 'Enter name of 3kar',
                    prefix: Icons.drive_file_rename_outline),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: areaController,
                    type: TextInputType.number,
                    validate: (value) {},
                    label: 'Enter Area of 3kar',
                    prefix: Icons.straighten),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: detailsController,
                    type: TextInputType.text,
                    validate: (value) {},
                    label: 'Enter Details of 3kar',
                    prefix: Icons.details),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: addressController,
                    type: TextInputType.text,
                    validate: (value) {},
                    label: 'Enter Address of 3kar',
                    prefix: Icons.location_city),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: roomsController,
                    type: TextInputType.number,
                    validate: (value) {},
                    label: 'Enter Rooms of 3kar',
                    prefix: Icons.meeting_room_sharp),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: kitchenController,
                    type: TextInputType.number,
                    validate: (value) {},
                    label: 'Enter Kitchen of 3kar',
                    prefix: Icons.kitchen),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: pathsController,
                    type: TextInputType.number,
                    validate: (value) {},
                    label: 'Enter Paths of 3kar',
                    prefix: Icons.bathtub_outlined),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                    controller: priceController,
                    type: TextInputType.number,
                    validate: (value) {},
                    label: 'Enter Price of 3kar',
                    prefix: Icons.price_change_outlined),
                const SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: GetStorage().read('isDarkTheme') == true
                              ? Colors.grey.shade500
                              : Colors.black45),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  onChanged: (phone) {
                    phoneNum = phone.number;
                  },
                  onCountryChanged: (country) {
                    CountryCode = country.dialCode;
                  },
                ),
                const AddAkarOption(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectImage(),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, AkarLocation());
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_location_alt_outlined,
                            size: 100,
                            color: GetStorage().read('isDarkTheme') == true
                                ? Colors.white
                                : mainColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextUtils(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              text: 'Add 3Kar Location',
                              color: GetStorage().read('isDarkTheme') == true
                                  ? Colors.white
                                  : mainColor,
                              underLine: TextDecoration.none),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
