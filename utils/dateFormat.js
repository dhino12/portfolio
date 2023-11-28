function dateFormatMontDate(dateNow) {
    // Membuat objek Date dari tanggal awal
    const dateObj = new Date(dateNow);

    // Mendapatkan nilai tanggal, bulan, dan tahun
    const date = dateObj.getDate();
    const month = dateObj.getMonth(); // Perlu diingat bahwa indeks bulan dimulai dari 0 (0 = Januari, 1 = Februari, dst.)
    const year = dateObj.getFullYear();

    // Array untuk menyimpan nama bulan dalam format singkat (tiga huruf)
    const shortNameMonth = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    // Mendapatkan nama bulan dari array namaBulanSingkat
    const monthName = shortNameMonth[month];

    // Menggabungkan kembali dalam format "DD - MMM"
    const dateFormated = date + " " + monthName;
    return dateFormated
}

export {dateFormatMontDate}