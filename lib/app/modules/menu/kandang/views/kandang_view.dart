import 'package:crud_flutter_api/app/modules/menu/kandang/controllers/kandang_controller.dart';
import 'package:crud_flutter_api/app/widgets/message/empty.dart';
import 'package:crud_flutter_api/app/widgets/message/no_data.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';

class KandangView extends GetView<KandangController> {
  const KandangView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KandangController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.loadKandang();
        },
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: EasySearchBar(
              searchBackgroundColor: AppColor.secondary,
              elevation: 0,
              searchCursorColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.white),
              searchClearIconTheme: const IconThemeData(color: Colors.white),
              searchBackIconTheme: const IconThemeData(color: Colors.white),
              systemOverlayStyle: SystemUiOverlayStyle.light,
              searchHintText: 'Cari ID Kandang',
              searchTextStyle: const TextStyle(color: Colors.white),
              title: const Text(
                'Data Kandang',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColor.secondary,
              onSearch: (value) => controller.searchKandang(value)),
          body: Obx(
            () {
              if (controller.posts.value.status == 200) {
                if (controller.posts.value.content!.isEmpty) {
                  return const EmptyView();
                } else {
                  return ListView.separated(
                    itemCount: controller.filteredPosts.value.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      var postData = controller.filteredPosts.value[index];
                      return InkWell(
                        onTap: () => {
                          Get.toNamed(Routes.DETAILKANDANG, arguments: {
                            "idKandang": "${postData.idKandang}",
                            "idPeternak": "${postData.idPeternak?.idPeternak}",
                            "namaPeternak":
                                "${postData.idPeternak?.namaPeternak}",
                            "luas": "${postData.luas}",
                            "kapasitas": "${postData.kapasitas}",
                            "nilaiBangunan": "${postData.nilaiBangunan}",
                            "alamat": "${postData.alamat}",
                            "desa": "${postData.desa}",
                            "kecamatan": "${postData.kecamatan}",
                            "kabupaten": "${postData.kabupaten}",
                            "provinsi": "${postData.provinsi}",
                            "fotoKandang": "${postData.fotoKandang}",
                            "latitude": "${postData.latitude}",
                            "longitude": "${postData.longitude}",
                            "jenisHewan": "${postData.jenisHewan}",
                          }),
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                color: const Color.fromARGB(255, 0, 47, 255)
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 10, // changes position of shadow
                              ),
                            ],
                            color: AppColor.primaryExtraSoft,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1, color: AppColor.primaryExtraSoft),
                          ),
                          padding: const EdgeInsets.only(
                              left: 20, top: 15, right: 29, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   (postData.status == null)
                                  //       ? "-"
                                  //       : "ID Kandang: ${postData.idKandang}",
                                  //   overflow: TextOverflow.fade,
                                  //   softWrap: false,
                                  //   style: const TextStyle(
                                  //       fontSize: 18,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    (postData.idPeternak?.namaPeternak == null)
                                        ? "Nama Peternak: -"
                                        : "Nama Peternak: ${postData.idPeternak?.namaPeternak}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    (postData.status == null)
                                        ? "-"
                                        : "Luas Kandang: "
                                            "${postData.luas}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    (postData.jenisHewan == null)
                                        ? "-"
                                        : "Jenis Hewan: ${postData.jenisHewan}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              } else {
                return const NoData();
              }
            },
          ),
          floatingActionButton: (controller.role == 'ROLE_PETERNAK')
              ? null
              : Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.ADDKANDANG);
                    },
                    backgroundColor: const Color(0xff132137),
                    child: const Icon(
                      Icons.add,
                      color: Colors.amber,
                    ),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
