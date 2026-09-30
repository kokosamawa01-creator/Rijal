<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZALLGRADE — Premium Demo</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    min-height: 100vh;
    font-family: Arial, sans-serif;
    background:
        radial-gradient(circle at 15% 10%, #66d4ff 0%, transparent 30%),
        radial-gradient(circle at 90% 20%, #1685ff 0%, transparent 35%),
        linear-gradient(145deg, #0067d9, #008cff 55%, #004fc4);
    color: white;
}

/* LOGIN */
.login-page {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

.login-box {
    width: 100%;
    max-width: 390px;
    padding: 28px;
    border-radius: 25px;
    background: rgba(2, 45, 115, 0.88);
    border: 1px solid rgba(255,255,255,.25);
    box-shadow: 0 25px 70px rgba(0,0,0,.35);
}

.logo {
    text-align: center;
    font-size: 30px;
    font-weight: 900;
    margin-bottom: 5px;
}

.subtitle {
    text-align: center;
    color: #cce9ff;
    font-size: 13px;
    margin-bottom: 25px;
}

.demo-warning {
    background: rgba(255,193,7,.14);
    border: 1px solid rgba(255,193,7,.4);
    color: #ffe9a6;
    padding: 11px;
    border-radius: 12px;
    font-size: 11px;
    text-align: center;
    margin-bottom: 20px;
}

label {
    display: block;
    font-size: 13px;
    font-weight: bold;
    margin: 13px 0 7px;
}

input,
select {
    width: 100%;
    padding: 14px;
    border-radius: 13px;
    border: 1px solid rgba(255,255,255,.2);
    background: rgba(0,30,80,.7);
    color: white;
    outline: none;
    font-size: 15px;
}

input::placeholder {
    color: #9fc4e8;
}

button {
    width: 100%;
    border: 0;
    border-radius: 14px;
    padding: 15px;
    margin-top: 20px;
    font-weight: 900;
    font-size: 15px;
    cursor: pointer;
}

.login-btn {
    background: white;
    color: #006bd6;
}

.error {
    display: none;
    margin-top: 15px;
    padding: 12px;
    border-radius: 12px;
    background: rgba(239,68,68,.18);
    border: 1px solid rgba(239,68,68,.4);
    color: #ffd0d0;
    text-align: center;
    font-size: 13px;
}

/* HOME */
.home {
    display: none;
    min-height: 100vh;
    padding-bottom: 30px;
}

.header {
    padding: 25px 20px;
    background: rgba(0,75,170,.5);
    border-bottom: 1px solid rgba(255,255,255,.15);
}

.header h1 {
    margin: 0;
    font-size: 27px;
}

.header p {
    margin: 7px 0 0;
    color: #d8efff;
    font-size: 13px;
}

.container {
    width: 100%;
    max-width: 450px;
    margin: auto;
    padding: 20px;
}

.card {
    background: rgba(3,43,108,.87);
    border: 1px solid rgba(255,255,255,.2);
    border-radius: 22px;
    padding: 21px;
    margin-bottom: 18px;
    box-shadow: 0 15px 40px rgba(0,0,0,.18);
}

.card h2 {
    margin-top: 0;
    font-size: 19px;
}

.upgrade-btn {
    background: linear-gradient(90deg,#fff,#d8f1ff);
    color: #006bd6;
}

.history-item {
    padding: 14px 0;
    border-bottom: 1px solid rgba(255,255,255,.12);
}

.history-item:last-child {
    border-bottom: 0;
}

.history-title {
    font-weight: bold;
}

.history-info {
    color: #c5e6ff;
    font-size: 12px;
    margin-top: 5px;
}

.status {
    display: inline-block;
    margin-top: 7px;
    padding: 5px 9px;
    border-radius: 999px;
    background: rgba(34,197,94,.18);
    color: #a7f3d0;
    font-size: 10px;
    font-weight: bold;
}

.result {
    display: none;
    margin-top: 15px;
    padding: 15px;
    border-radius: 14px;
    background: rgba(34,197,94,.12);
    border: 1px solid rgba(34,197,94,.3);
    font-size: 13px;
}

.logout {
    background: rgba(255,255,255,.12);
    color: white;
    border: 1px solid rgba(255,255,255,.2);
}

.footer {
    text-align: center;
    color: #bde3ff;
    font-size: 10px;
    padding: 15px;
}
</style>
</head>

<body>

<!-- ================= LOGIN ================= -->

<div class="login-page" id="loginPage">

    <div class="login-box">

        <div class="logo">ZALLGRADE</div>

        <div class="subtitle">
            Premium Upgrade Simulator
        </div>

        <div class="demo-warning">
            ⚠️ SIMULASI / DEMO — BUKAN LAYANAN RESMI
        </div>

        <label>Username</label>
        <input
            type="text"
            id="username"
            placeholder="Masukkan username"
            autocomplete="off"
        >

        <label>Password</label>
        <input
            type="password"
            id="password"
            placeholder="Masukkan password"
            autocomplete="off"
        >

        <button class="login-btn" onclick="login()">
            MASUK
        </button>

        <div class="error" id="loginError">
            ❌ Username atau password salah.
        </div>

    </div>

</div>


<!-- ================= HOME ================= -->

<div class="home" id="homePage">

    <div class="header">
        <h1>⚡ ZALLGRADE</h1>
        <p>Premium Upgrade Simulator • DEMO</p>
    </div>

    <div class="container">

        <!-- UPGRADE -->
        <div class="card">

            <h2>💎 Upgrade Dompet Digital</h2>

            <label>Pilih layanan</label>

            <select id="service">
                <option>DANA</option>
                <option>GoPay</option>
                <option>OVO</option>
                <option>ShopeePay</option>
            </select>

            <label>Nama Demo</label>

            <input
                type="text"
                id="demoName"
                placeholder="Contoh: Budi Demo"
                autocomplete="off"
            >

            <label>Nomor Demo</label>

            <input
                type="text"
                id="demoNumber"
                placeholder="Contoh: 08XX-XXXX-XXXX"
                autocomplete="off"
            >

            <button class="upgrade-btn" onclick="upgrade()">
                UPGRADE PREMIUM
            </button>

            <div class="result" id="result"></div>

        </div>


        <!-- RIWAYAT -->
        <div class="card">

            <h2>🧾 Riwayat Upgrade Dompet Digital</h2>

            <div id="history">

                <div class="history-item">
                    <div class="history-title">
                        DANA Premium
                    </div>

                    <div class="history-info">
                        Demo User • 08XX-XXXX-XXXX
                    </div>

                    <span class="status">
                        SIMULASI
                    </span>
                </div>

                <div class="history-item">
                    <div class="history-title">
                        GoPay Premium
                    </div>

                    <div class="history-info">
                        Demo User • 08XX-XXXX-XXXX
                    </div>

                    <span class="status">
                        SIMULASI
                    </span>
                </div>

            </div>

        </div>


        <button class="logout" onclick="logout()">
            KELUAR
        </button>

        <div class="footer">
            DEMO ONLY — Tidak terhubung dengan DANA, GoPay,
            OVO, ShopeePay, atau layanan pembayaran lainnya.
        </div>

    </div>

</div>


<script>

/* ================= LOGIN ================= */

function login() {

    const username =
        document.getElementById("username").value;

    const password =
        document.getElementById("password").value;

    const error =
        document.getElementById("loginError");

    /*
       KREDENSIAL SIMULASI
       Username: ZALLGRADE
       Password: UPGRADE
    */

    if (
        username === "ZALLGRADE" &&
        password === "UPGRADE"
    ) {

        document.getElementById("loginPage").style.display =
            "none";

        document.getElementById("homePage").style.display =
            "block";

    } else {

        error.style.display = "block";

    }
}


/* ================= UPGRADE ================= */

function upgrade() {

    const service =
        document.getElementById("service").value;

    const name =
        document.getElementById("demoName").value.trim();

    const number =
        document.getElementById("demoNumber").value.trim();

    const result =
        document.getElementById("result");

    if (!name || !number) {

        result.style.display = "block";

        result.innerHTML =
            "⚠️ Silakan isi nama demo dan nomor demo.";

        return;
    }

    result.style.display = "block";

    result.innerHTML =
        "✅ <b>SIMULASI BERHASIL</b><br><br>" +
        "Layanan: <b>" + escapeHTML(service) + "</b><br>" +
        "Nama: <b>" + escapeHTML(name) + "</b><br>" +
        "Nomor: <b>" + escapeHTML(number) + "</b><br><br>" +
        "Status: <b>PREMIUM (DEMO)</b>";

    /*
       Tambahkan riwayat secara lokal.
       Tidak dikirim ke server.
    */

    const history =
        document.getElementById("history");

    const item =
        document.createElement("div");

    item.className = "history-item";

    item.innerHTML =
        '<div class="history-title">' +
        escapeHTML(service) +
        ' Premium</div>' +

        '<div class="history-info">' +
        escapeHTML(name) +
        ' • ' +
        escapeHTML(number) +
        '</div>' +

        '<span class="status">SIMULASI</span>';

    history.prepend(item);
}


/* ================= LOGOUT ================= */

function logout() {

    document.getElementById("homePage").style.display =
        "none";

    document.getElementById("loginPage").style.display =
        "flex";

    document.getElementById("username").value = "";
    document.getElementById("password").value = "";

    document.getElementById("loginError").style.display =
        "none";
}


/* ================= SECURITY ================= */

function escapeHTML(text) {

    return text.replace(/[&<>"']/g, function(char) {

        return {
            "&": "&amp;",
            "<": "&lt;",
            ">": "&gt;",
            '"': "&quot;",
            "'": "&#039;"
        }[char];

    });

}

</script>

</body>
</html>
