# myportofolio_mobile

A new Flutter project.

## == IDENTITAS ==

Name : Fathir

NPM : 2506539523

Class : PBP F

## == UPDATE ==

> Tutorial 8
- Finished Tutorial 8

> Tugas 7
- Setup dan Inisialisasi Proyek
- Informasi Profil Pemilik Portofolio (InfoCard)
- Menu Aksi Portofolio (ItemCard) & Kustomisasi Warna
- Mengimplementasikan warna latar (background color) yang berbeda untuk setiap tombol aksi
    - Warna merah untuk "Lihat Proyek"
    - Warna hijau untuk "Tambah Proyek"
    - Warna biru untuk "Logout"
- (Note: Sebagian besar sudah dilaksanakan pada tutorial 8)
- Creativity:
    - New OnHover effect pada masing-masing tombol aksi (StatefulWidget)
    - Experimenting color palette
    - New HelloCard to say "Hello User!"
- Pertanyaan Reflektif
- Deklarasi AI

> Tutorial 9
- Finished Tutorial 9
- Typo commit

> Tugas 8
- Create new "Experience Form" feature
  - Experience Name (Wajib)
  - Experience Description (Wajib)
  - Experience Category (Default)
  - Experience Timeline (Wajib)
  - Experience Link (Opsional)
- Added new "Add Experience" option to Drawer
- Added new Validator for "Experience" and "Project" Form
- Redesign Menu
  - Adding New Button ("Tambah Experience", "Lihat Experience", "Login")
  - Adjust the position of all buttons
  - Adjust button colors
  - Adjust button size
- (Note: The updates include creativity)

## == PERTANYAAN REFLEKTIF - TUGAS 7 ==
1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?
6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

### Tugas 7
1. Widget tree merupakan struktur hierarkis yang menggambarkan susunan widget dalam aplikasi Flutter. Konsep utama Flutter adalah membangun tampilan aplikasi dengan mengombinasikan widget-widget. Setiap widget dapat memiliki widget lain sebagai anaknya (child) sehingga membentuk struktur mirip tree.

Dalam hubungan parent-child, parent merupakan widget yang membungkus widget lain, sedangkan child merupakan widget yang berada di dalam parent. Hubungan parent-child berhubungan dengan mekanisme Flutter. Nah, ada tiga aturan dalam proses layout Flutter, yaitu Constraints go down, Sizes go up, Parent sets position. Hal tersebut berarti parent dapat memberikan batasan ukuran kepada child, child menentukan ukurannya berdasarkan batasan tersebut, lalu parent menentukan posisi child di dalam layout.

Misalkan, pada proyek saya, widget Scaffold memiliki AppBar dan body. Lalu, body memiliki Padding sebagai parent yang membungkus Column. Di dalam Column, terdapat widget Row, SizedBox, dan Center yang masing-masing memiliki fungsi dalam menyusun tampilan.

2. Widget-widget yang saya gunakan pada proyek ini:
   - "Scaffold": menjadi kerangka dasar untuk halaman.
   - "Column": menyusun child secara vertikal, di mana posisi child diatur lewat "mainAxisAlignment" dan "crossAxisAlignment".
   - "Row": menyusun child secara horizontal, misalkan 3 "InfoCard" sejajar.
   - "Center": memposisikan child di tengah.
   - "GridView.count": menyusun child sesuai jumlah kolom, misalkan 3 kolom untuk masing-masing "ItemCard" dan grid ke-2 untuk "HelloCard".
   - "Padding": memberi jarak di keliling child, mirip padding pada umumnya.
   - "SizedBox": memberi jarak kosong atau mengisi sel kosong.
   - "Container": mengatur lebar dan padding isi kartu.
   - "AppBar": menjadi bar judul di bagian atas halaman.
   - "Text": menampilkan teks, misalkan judul, isi kartu, nama tombol.
   - "Icon": menampilkan ikon, misalkan pada "ItemCard".
   - "Material": kartu yang mendukung warna latar, radius, dsb yang menjadi dasar dari "ItemCard" dan "HelloCard".
   - "Card": kartu (mirip Material) yang menjadi dasar dari "InfoCard".
   - "InkWell": membuat bagian kartu bisa ditekan ("onTap") dan mendeteksi hover ("onHover").
   - "SnackBar": menampilkan pesan singkat di bawah layar saat kartu ditekan.
   - "ScaffoldMessenger": menampilkan "SnackBar" pada "Scaffold" terdekat.
   - "MaterialApp": pembungkus aplikasi yang menyediakan tema, judul, dan halaman awal ("home").

   Buatan:
   - "MyApp": widget root yang mengembalikan "MaterialApp" - (StatelessWidget) 
   - "MyHomePage": halaman utama di "menu.dart" - (StatelessWidget) 
   - "InfoCard": menampilkan NPM, nama, dan kelas - (StatelessWidget).
   - "ItemCard": menjadi tombol aksi dengan warna latar berbeda dan efek hover - (StatefulWidget).
   - "HelloCard": menjadi kartu sapaan yang menampilkan SnackBar "Halo (User)!" - (StatelessWidget).

3. MaterialApp merupakan widget yang menyediakan konfigurasi utama untuk aplikasi Flutter yang menggunakan konsep Material Design. Di mana, Widget ini berfungsi untuk mengatur berbagai aspek aplikasi, seperti tema, navigasi, judul aplikasi, dan halaman awal, jatuhnya mirip seperti base.

Dalam proyek MyPortfolio Mobile, MaterialApp digunakan di dalam class MyApp dengan konfigurasi berikut:
```
title: 'MyPortfolio' untuk menentukan judul aplikasi.
theme: ThemeData(...) untuk mengatur tema visual aplikasi, termasuk skema warna dan penggunaan Material Design 3.
home: MyHomePage() untuk menentukan halaman yang pertama kali ditampilkan ketika aplikasi dijalankan.
```

MaterialApp umumnya digunakan sebagai root widget karena menyediakan konfigurasi yang dapat digunakan oleh widget-widget lain di seluruh aplikasi. Dengan menjadikannya root widget, konfigurasi seperti tema dan sistem navigasi dapat diakses oleh widget yang berada di bawahnya.

Misalkan, pada halaman utama saya menggunakan Theme.of(context).colorScheme.primary untuk mengambil warna utama dari tema yang telah dikonfigurasi melalui MaterialApp. Hal ini memungkinkan tampilan aplikasi menggunakan skema warna yang konsisten tanpa harus menentukan warna secara manual pada setiap widget. 

4. StatelessWidget merupakan widget yang tidak memiliki state yang dapat berubah selama widget digunakan. Tampilan widget ditentukan oleh konfigurasi yang udah dibentuk sebelumnya. Widget ini lebih cocok digunakan ketika komponen yang tampilannya relatif tetap (konstan) dan tidak perlu mengelola perubahan state secara mandiri. Dari PPT ke-10, Stateless merupakan widget yang bersifat immutable yang berarti ketika ingin menampilkan sesuatu yang berbeda, widget perlu dibangun kembali dengan konfigurasi baru.

Pada proyek saya, misalkan class "HelloCard" dan "InfoCard" menggunakan StatelessWidget karena keduanya hanya menampilkan data dari constructor dan tidak menyimpan data yang berubah.

Sedangkan, StatefulWidget merupakan widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Perubahan state dapat menyebabkan Flutter membangun ulang tampilan widget agar sesuai dengan kondisi terbaru. Dari PPT ke-10, widget Stateful memungkinkan tampilan berubah secara dinamis berdasarkan event, seperti interaksi pengguna, operasi jaringan, maupun event dari sistem operasi.

Pada proyek saya, misalkan class "ItemCard" menggunakan StatefulWidget karena ada warna ikon dan teks yang berubah saat kursor berada di atas kartu.

Maka, pemilihan widget itu tergantung pada kebutuhan. StatelessWidget digunakan ketika widget tidak membutuhkan state yang berubah, sedangkan StatefulWidget digunakan ketika tampilan perlu melakukan perubahan state.

5. BuildContext merupakan objek yang merepresentasikan posisi suatu widget di dalam widget tree. Posisi widget di tree menentukan apa yang bisa diakses (tema, ukuran layar, Scaffold, Navigator, dsb). BuildContext menjadi dasar untuk mengambil informasi dari widget-widget di atasnya (ancestor).

BuildContext penting karena Flutter menggunakan struktur widget tree untuk menyediakan berbagai informasi yang dibutuhkan widget, seperti tema, ukuran, dan konfigurasi lainnya.

Dalam metode build(), BuildContext digunakan sebagai parameter melalui: 
"Widget build(BuildContext context)"

Pada proyek saya, misalkan konfigurasi warna AppBar: 
"backgroundColor: Theme.of(context).colorScheme.primary"

Pada kode tersebut, context digunakan oleh Theme.of(context) untuk mengambil tema yang tersedia pada posisi widget di dalam widget tree. Lalu, colorScheme.primary digunakan untuk mendapatkan warna utama aplikasi.

6. Hot reload merupakan fitur Flutter yang memungkinkan melihat perubahan kode secara langsung pada aplikasi yang sedang berjalan tanpa harus memulai ulang aplikasi. Fitur ini membantu mempercepat proses pengembangan karena perubahan dapat langsung diperiksa. Hot reload mempertahankan state aplikasi yang sedang berjalan.

Sedangkan, hot restart merupakan fitur yang memulai ulang aplikasi Flutter sehingga state aplikasi akan diinisialisasi kembali. Hot restart akan menghilangkan state yang sebelumnya tersimpan. 

Hot reload cocok digunakan ketika hanya melakukan perubahan pada tampilan, misalkan teks, warna, atau implementasi widget yang tidak membutuhkan inisialisasi ulang aplikasi. Hot restart diperlukan ketika perubahan kode membutuhkan eksekusi ulang fungsi main() atau inisialisasi ulang state, misalnya ketika mengubah nilai awal variabel global atau proses inisialisasi aplikasi. Selain itu, full restart diperlukan ketika terdapat perubahan pada kode native Android atau iOS, konfigurasi build, maupun perubahan dependency yang melibatkan kode native sehingga aplikasi perlu dibangun dan dijalankan kembali.

Makanya, karena ada kondisi tertentu, kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart.

## == PERTANYAAN REFLEKTIF - TUGAS 8 ==
1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.
2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.
3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.
4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

### Tugas 8
1. Perbedaan diantara ketiganya:
- Navigator.push() => Menambahkan route baru ke atas stack sehingga route tersebut tampil ke pengguna sementara route lama tetap berada di bawahnya dan bisa dikembalikan dengan tombol back.
- Navigator.pushReplacement() => Menghapus route yang sedang tampil (paling atas stack) dan menggantinya dengan route baru, tanpa mengubah route yang berada di bawahnya. Route lama yang digantikan tidak bisa dikembalikan.
- Navigator.pop() => Menghapus route paling atas dari stack sehingga aplikasi berpindah ke route di bawahnya. 

Metode yang digunakan untuk membuka formulir dari kartu aksi adalah "Navigator.push()". Metode tersebut membuka formulir (ProjectFormPage & ExperienceFormPage) tanpa menghapus halaman utama sehingga pengguna dapat kembali ke halaman utama setelah selesai mengisi formulir (dengan meng-klik tombol back).

Misalkan, dalam proyek ini:
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ProjectFormPage(),
  ),
);
```

Sedangkan, opsi Home pada Drawer menggunakan "Navigator.pushReplacement()". Metode ini membuat halaman yang sedang aktif digantikan oleh MyHomePage sehingga halaman formulir yang sedang aktif dihapus dari atas stack dan digantikan oleh MyHomePage, jadi pengguna langsung menuju ke halaman utama.

Misalkan, dalam proyek ini:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```

2. Scaffold berfungsi sebagai struktur dasar halaman dalam Flutter yang menyediakan beberapa komponen utama, seperti AppBar, Drawer, dan Body.

Dalam proyek ini, setiap halaman, baik MyHomePage, ProjectFormPage, maupun ExperienceFormPage, menggunakan Scaffold sebagai kerangka utama. Hal tersebut membuat susunan dan navigasi aplikasi menjadi tetap konsisten.

- Scaffold => Menyediakan struktur dasar halaman dan mengatur penempatan komponen utama.
- AppBar => Menampilkan bagian atas halaman yang berisi judul halaman, seperti "MyPortfolio", "Add Project Form", dan "Add Experience Form".
- Drawer => Menyediakan menu navigasi yang dapat digunakan pengguna untuk berpindah ke halaman "Home", "Add Project", dan "Add Experience".

Penerapan konsistensi tema adalah penggunaan Colors.indigo. Warna tersebut digunakan pada AppBar di halaman formulir maupun pada DrawerHeader di menu navigasi.

Misalkan, penggunaan warna tema portofolio di lebih dari satu halaman dalam proyek ini:
- "AppBar" pada halaman Add Project dan Add Experience memakai "Colors.indigo".
- "DrawerHeader" pada "LeftDrawer" memakai "Colors.indigo" yang dipakai di semua halaman.
- Tombol Save pada kedua formulir yang memakai "Colors.indigo".

3. Tata letak formulir menggunakan SingleChildScrollView, Column, dan Padding. Tata letak ini dipilih karena kolom-kolom formulir (nama, deskripsi, kategori, timeline, link) diisi berurutan dari atas ke bawah sehingga alur pengisiannya jelas.

- Column => Mengatur seluruh komponen formulir agar tersusun secara vertikal, seperti Nama, Deskripsi, Kategori, Teknologi/Timeline, Link, dan tombol Save.
- Padding => Memberikan jarak di setiap komponen agar kolom input tidak terlalu berdekatan dan tampilan jadi lebih rapi. Misalkan, dalam kode ini digunakan EdgeInsets.all(8.0) untuk memberikan jarak sebesar 8 pixel (setiap sisi).
- SingleChildScrollView => Memungkinkan pengguna meng-scroll halaman apabila seluruh komponen formulir tidak dapat ditampilkan secara langsung atau terpotong karena ruang layar terbatas (overflow).

Penggunaan SingleChildScrollView penting karena apabila ukuran layar relatif kecil, pengguna tetap dapat mengakses seluruh kolom input dan tombol Save tanpa ada komponen yang terpotong karena ruang layar terbatas.

Misalkan, dalam proyek ini, ketika pengguna membuka Experience Form atau Project Form dan ukuran layar tidak cukup untuk menampilkan seluruh formulir, pengguna dapat meng-scroll ke bawah untuk mengakses bagian lainnya.'

4. Peran masing-masing saat tombol Simpan ditekan:
- GlobalKey<FormState> => Kunci (unik) untuk Form yang menghubungkan tombol Save dengan state formulir. Melalui "_formKey.currentState", tombol dapat mengakses dan menjalankan validasi seluruh field di dalam Form.
- validator => Memeriksa isi kolom input dari pengguna, apabila terdapat kesalahan input (tidak valid), maka akan mengembalikan pesan error yang sesuai. 
- validate() => Menjalankan semua "validator" dari Field, menampilkan pesan kesalahan pada kolom yang bermasalah, dan mengembalikan true hanya jika semua kolom valid. Dalam proyek ini, "showDialog()" hanya dipanggil setelah seluruh input lolos.

Misalkan, pada ExperienceForm, nilai yang ditolak: 
- Nama Experience diisi spasi saja ("   ") -> Validator memakai value.trim().isEmpty -> Ditolak, pesan "Nama experience tidak boleh kosong!". 
- Link Experience diisi "kentang" -> ditolak karena tidak diawali "http" atau "https" dan tidak memiliki host.

Memilih jenis input atau papan ketik saja belum cukup karena itu hanya mengatur cara pengguna mengetik, bukan input yang dimasukkan. Misalkan, papan ketik teks tetap dapat menerima spasi, teks yang terlalu pendek atau panjang, maupun teks yang bukan URL tanpa memastikan kolomnya sudah terisi. Aturan tertentu seperti tidak boleh kosong, batas panjang, dan format URL hanya bisa dibentuk melalui validator yang dijalankan validate().


## == AI Declaration ==

Note:
Pada tugas 8 ini saya tidak menggunakan AI untuk memberikan kode secara langsung / jiplak-menjiplak.

Strategi Prompting:
Saya menggunakan "ChatGPT" sebagai wadah untuk bertanya terkait tutorial dan kode pada program saya. Ada beberapa bagian yang saya cari melalui AI Overview Google juga.
Hal tersebut guna mempercepat dan memperjelas pencarian terkait apa yang saya perlukan, serta menghilangkan beberapa error yang terjadi.

Contoh:
1. Saya bertanya terkait baris per baris dari kode yang sebelumnya dijelaskan pada "Tutorial 9".

Input: "Bisakah anda jelaskan baris per baris terkait kode program ini"

```
// === Project Name ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Nama Project",
        labelText: "Nama Project",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _projectName = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return "Nama project tidak boleh kosong!";
        }
        return null;
      },
    ),
  ),
```

Output:

```
> InputDecoration
decoration: InputDecoration(
  hintText: "Nama Experience",
  labelText: "Nama Experience",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
),

decoration digunakan untuk mengatur tampilan atau dekorasi dari TextFormField.

Di dalamnya terdapat beberapa properti.
1. hintText -> Menampilkan teks petunjuk di dalam kolom input ketika pengguna belum memasukkan teks.
2. labelText -> Memberikan label atau keterangan pada kolom input.

> OnChanged
onChanged: (String? value) {
  setState(() {
    _experienceName = value!;
  });
},
```

**Dari hasil prompting tersebut, membantu saya dalam menjelaskan beberapa bagian pertanyaan reflektif, serta membantu dalam proses pembuatan kode proyek ini.**

2. Saya bertanya terkait bagaimana cara menerapkan Field Waktu (showDatePicker()).

Input: "Bisakah Anda jelaskan bagaimana fungsi showDatePicker?"

```
// === Experience Timeline ===
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: showDatePicker(
      decoration: InputDecoration(
        hintText: "Contoh: Flutter, Django, Figma",
        labelText: "Teknologi yang Digunakan",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _timeline = value!;
        });
      },
    ),
  ),
```

Output:

```
Apa itu showDatePicker?
showDatePicker() adalah fungsi bawaan Flutter yang digunakan untuk menampilkan dialog pemilihan tanggal (date picker).

Misalnya, pengguna ingin memasukkan tanggal mulai dan tanggal selesai sebuah experience.
Ketika fungsi ini dipanggil, Flutter akan menampilkan kalender sehingga pengguna bisa memilih tanggal.

Berbeda dengan TextFormField:
- Memasukkan teks, sedangkan showDatePicker pengguna memilih tanggal melalui kalender
- Menggunakan onChanged, sedangkan showDatePicker menggunakan onConfirm secara internal melalui hasil Future

Contoh implementasi sederhana:
// === Experience Timeline ===
Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        setState(() {
          _timeline = pickedDate;
        });
      }
    },
    child: const Text("Pilih Tanggal Experience"),
  ),
),
```

**Dari hasil prompting tersebut, saya menyadari bahwa ternyata showDatePicker() tidak dapat digunakan layaknya field-field yang digunakan sebelumnya, seperti TextFormField dan DropdownButtonFormField. Di sini ternyata showDatePicker() itu dapat diaktifkan melalui sebuah "Action". Selain itu, saya juga perlu berkreasi untuk menyamakan design layout yang sebelumnya sudah dibentuk.**

*Note: Saya juga mencari-cari informasi melalui "Flutter Documentations".*