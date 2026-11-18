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

## == PERTANYAAN REFLEKTIF - TUGAS 6 ==
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

## == AI Declaration ==

Note:
Pada tugas 7 ini saya tidak menggunakan AI untuk memberikan kode secara langsung / jiplak-menjiplak.

Strategi Prompting:
Saya menggunakan "ChatGPT" sebagai wadah untuk bertanya terkait tutorial dan kode pada program saya. 
Hal tersebut guna mempercepat dan memperjelas pencarian terkait apa yang saya perlukan, serta menghilangkan beberapa error yang terjadi.

Contoh:
Sebagian besar prompting adalah pertanyaan tentang kode pada bagian Tutorial 7.
1. Bisakah Anda menjelaskan bagian program ini dari awal sampai akhir:
```
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2";
  final String nama = "F";
  final String kelas = "PBP F";

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder),
    ItemHomepage("Tambah Proyek", Icons.add_circle),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      // AppBar menampilkan bar bagian atas halaman aplikasi.
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman utama dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Baris horizontal untuk menampilkan 3 InfoCard secara sejajar.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            // Bagian tengah: pesan sambutan dan kisi tombol menu portofolio.
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di MyPortfolio Mobile!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // GridView menampilkan kartu tombol dalam tata letak kisi 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // shrinkWrap agar ukuran kisi menyesuaikan tinggi konten anak.
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Contoh output:
```
[Body: konten utama halaman]
body: Padding()
  padding: const EdgeInsets.all(16.0),
  child: Column()
    crossAxisAlignment: CrossAxisAlignment.center,
    children: []

Ini merupakan awal dari isi halaman.
Kita punya tiga widget penting di sini:
- Padding
- Column
- children

[Padding]
Padding(
  padding: const EdgeInsets.all(16.0),
)

Padding memberikan jarak antara konten di dalamnya dengan batas luar widget.

EdgeInsets.all(16.0) berarti memberikan jarak sebesar 16 logical pixels pada keempat sisi:
- Atas: 16
- Bawah: 16
- Kiri: 16
- Kanan: 16
Kenapa dibutuhkan? Agar konten tidak terlalu menempel pada tepi layar.

[child]
child: Column()
child berarti widget yang menjadi anak dari Padding.

Dalam kasus ini, anaknya adalah Column.
Perhatikan perbedaannya:
- child: hanya menerima satu widget.
- children: menerima banyak widget dalam bentuk list.

[Column]
Column digunakan untuk menyusun widget secara vertikal (dari atas ke bawah).

Contohnya:
Column(
  children: [
    Text("Pertama"),
    Text("Kedua"),
    Text("Ketiga"),
  ],
)
```