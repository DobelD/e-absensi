import 'dart:convert';
import 'package:eabsenku/app/data/murid_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AbsensiController extends GetxController {
  Map<String, dynamic>? selectedKelas;
  List<Map<String, dynamic>> kelas = [
    {
      "kelas": "10 IPA 1",
      "jam": "07:30 - 15:20",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
    {
      "kelas": "10 IPA 2",
      "jam": "07:30 - 07:45",
      "pelajaran": "Ilmu Pengetahuan Sosial"
    },
    {"kelas": "10 IPA 3", "jam": "07:30 - 09:45", "pelajaran": "Agama Islam"},
    {"kelas": "11 IPA 1", "jam": "07:30 - 09:45", "pelajaran": "Matematika"},
    {
      "kelas": "11 IPA 2",
      "jam": "07:30 - 22:45",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
    {
      "kelas": "11 IPA 3",
      "jam": "07:30 - 09:45",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
    {
      "kelas": "12 IPA 1",
      "jam": "07:30 - 09:45",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
    {
      "kelas": "12 IPA 2",
      "jam": "07:30 - 09:45",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
    {
      "kelas": "12 IPA 3",
      "jam": "08:40 - 09:45",
      "pelajaran": "Ilmu Pengetahuan Alam"
    },
  ];
  String? jamKelas;
  String? startjamKelas;
  String? endjamKelas;
  String? pelajaranKelas;
  void changeKelas(Map<String, dynamic> value) {
    selectedKelas = value;
    jamKelas = value['jam'];
    List<String> splitJam = value['jam'].split(" - ");
    startjamKelas = splitJam[0];
    endjamKelas = splitJam[1];
    pelajaranKelas = value['pelajaran'];
    print(selectedKelas);
    print("${startjamKelas}");
    print("${endjamKelas}");
    print(pelajaranKelas);
    update();
  }

  List<Map<String, dynamic>> absenDays = [];
  List<Map<String, dynamic>> abbsenns = [];
  void hadir(bool value, int index) {
    if (value == true) {
      listMurids[index].h_status = true;
      listMurids[index].iz_status = false;
      listMurids[index].a_status = false;
      absenDays.add({"nama": listMurids[index].nama, "status": value == "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "I"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "A"});
      print(absenDays);
    } else {
      listMurids[index].h_status = false;
      listMurids[index].iz_status = false;
      listMurids[index].a_status = false;
      absenDays.remove({"nama": listMurids[index].nama, "status": "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "I"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "A"});
      print(absenDays);
    }
    update();
  }

  void izin(bool value, int index) {
    if (value == true) {
      listMurids[index].iz_status = true;
      listMurids[index].h_status = false;
      listMurids[index].a_status = false;
      absenDays.add({"nama": listMurids[index].nama, "status": "I"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "A"});
      print(absenDays);
    } else {
      listMurids[index].iz_status = false;
      listMurids[index].h_status = false;
      listMurids[index].a_status = false;
      absenDays.remove({"nama": listMurids[index].nama, "status": "I"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "A"});
      print(absenDays);
    }
    update();
  }

  void absen(bool value, int index) {
    if (value == true) {
      listMurids[index].a_status = true;
      listMurids[index].h_status = false;
      listMurids[index].iz_status = false;
      absenDays.add({"nama": listMurids[index].nama, "status": "A"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "I"});
      print(absenDays);
    } else {
      listMurids[index].a_status = false;
      listMurids[index].h_status = false;
      listMurids[index].iz_status = false;
      absenDays.remove({"nama": listMurids[index].nama, "status": "A"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "H"});
      absenDays.remove({"nama": listMurids[index].nama, "status": "I"});
      print(absenDays);
    }
    update();
  }

  var formatted = DateFormat("HH:mm").format(DateTime.now());
  void date() {
    print("Current time: $formatted");
  }

  List<Murid> listMurids = [];
  List<Murid> murids = [];
  getMurid() async {
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbyxjkxHUin2WnGALvIh3nnsXhegqK0rcGRBm51O8SGR4jL9YeYPA_jL1OryQJlDdJWrGg/exec'));
    print(response.statusCode);
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      murids = (json.decode(response.body) as List)
          .map((e) => Murid.fromJson(e))
          .toList();
      listMurids = murids;
      update();
    } else {
      throw Exception('Failed to load murid');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getMurid();
  }
}
