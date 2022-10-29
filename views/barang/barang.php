<caption><h1>Daftar Barang</h1></caption>
<table border=1>
    <thead>
        <th>Id Barang</th>
        <th>Nama Barang</th>
        <th>Jenis Barang</th>
        <th>Stok Barang</th>
        <th>Harga Barang</th>
        <th>Status Barang</th>
        <th>pengirim</th>
        <th>colspan="2">Tools</th>
    </thead>
    <?php
        foreach ($data['barang'] as $barang) {
    ?>
    <tbody>
        <td><?= $barang['idbarang']?></td>
        <td><?= $barang['nmbarang']?></td>
        <td><?= $barang['jenisbarang']?></td>
        <td><?= $barang['stok']?></td>
        <td><?= $barang['harga']?></td>
        <?php
        if($barang['status']==1){
            $status="ready";
        }else{
            status="sold Out";
        }
        ?>
        <td><?= $barang['status']?></td>
        <td><?= $barang['nmdist']?></td>
        <td>ubah</td>
        <td>Hapus</td>
    </tbody>
    <?php } ?>
        </table>