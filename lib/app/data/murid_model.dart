class Murid {
  int? i;
  int? no;
  String? nama;
  int? h;
  int? iz;
  int? a;
  bool? h_status;
  bool? iz_status;
  bool? a_status;
  String? keterangan;

  Murid(
      {this.i,
      this.no,
      this.nama,
      this.h,
      this.iz,
      this.a,
      this.h_status,
      this.iz_status,
      this.a_status,
      this.keterangan});

  Murid.fromJson(Map<String, dynamic> json) {
    i = json['i'];
    no = json['No'];
    nama = json['Nama'];
    h = json['H'];
    iz = json['Iz'];
    a = json['A'];
    h_status = false;
    iz_status = false;
    a_status = false;
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['i'] = this.i;
    data['No'] = this.no;
    data['Nama'] = this.nama;
    data['H'] = this.h;
    data['Iz'] = this.iz;
    data['A'] = this.a;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
