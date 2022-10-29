<caption><h1> Data Distributor<h1></caption>
<form action="<?= $base_url?>distributor/save" method="post">
    <label for="">Nama Distributor</label>
    <input type="text" name="nmdist" id=""required>
    <label for="">Alamat</label>
    <textarea name="alamat" id="" required></textarea>
    <label for="">No Telepon</label>
    <input type="text" name="notelp" id=""required>
    <input type="submit" value="Simpan">
    <input type="reset" value="Batal">
</form>