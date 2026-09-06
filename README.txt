# Website Karang Taruna Desa — Modern & Elegan

## Struktur
- `index.html` — halaman utama
- `style.css` — semua styling dan variabel warna
- `script.js` — menu mobile + animasi ringan
- `assets/` — tempat foto background dan foto kegiatan

## Cara mengganti background utama
1. Masukkan foto Anda ke folder `assets/`.
2. Beri nama `background.jpg`, atau gunakan nama file lain.
3. Buka `style.css`.
4. Cari bagian:
   `--hero-bg: url("assets/background.jpg");`
5. Ganti nama/path file jika perlu.

Contoh:
`--hero-bg: url("assets/foto-desa-saya.jpg");`

Foto sebaiknya landscape dengan resolusi minimal 1600x900 agar hero terlihat bagus.

## Mengganti foto kegiatan
Di `style.css`:
- `--activity-1`
- `--activity-2`
- `--activity-3`

## Mengganti nama desa, kontak, statistik, berita
Semua teks utama ada langsung di `index.html`, jadi mudah diedit tanpa framework.

## Menjalankan
Cukup buka `index.html` di browser.

Untuk hosting, upload seluruh folder ke hosting/cPanel/Netlify/Vercel/GitHub Pages.
