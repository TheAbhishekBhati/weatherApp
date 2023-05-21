import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/helper.dart';
import '../../controller/dashboard_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Get any City Data',
          style: GoogleFonts.nunitoSans(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: AppColors.darkPurple),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.red, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.grey, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: AppColors.darkPurple, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    (value);
                  },
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          borderRadius: BorderRadius.circular(25)),
                      height: 50,
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        'Search',
                        style: GoogleFonts.nunitoSans(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                      )),
                  onTap: () {
                    controller.changeCity(_searchController.text);
                    controller.changeIndex(0);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Predefined Cities',
                  style: GoogleFonts.nunitoSans(
                      color: AppColors.darkPurple,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: predefinedCities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      color: AppColors.lightPurple,
                      child: ListTile(
                        title: Text(
                          predefinedCities[index],
                          style: GoogleFonts.nunitoSans(
                              color: AppColors.darkPurple,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        onTap: () {
                          controller.changeCity(predefinedCities[index]);
                          controller.currentPageIndex(0);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
