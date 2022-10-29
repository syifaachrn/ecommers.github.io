<?php
if($aksi=='index'){
    $data['jenis']=$db->query($connect,"SELECT * FROM tjenis");
    $helpers->load_view('jenis/jenis.php',$data);
}
if($aksi=='Add'){
    $helpers->load_view('jenis/addjenis.php');
}
if($aksi=='save'){
    $jenisbarang=$_POST['jenisbarang'];
    $ket=$_POST['ket'];<td><a href="<?= $base_url.'jenis/edit/'.$jenis['idjenis']?>">Ubah</a></td>
<td><a href="<?= $base_url.'jenis/hapus/'.$jenis['idjenis']?>" onclick="return confirm('Yakin dihapus?')">Hapus</a></td>
    $simpan=$db->qry($connect,"INSERT INTO tjenis VALUES('','$jenisbarang','$ket')");
    if($simpan)
        header('location:'.$base_url. 'jenis');
    else{
        header('location:'.$base_url.'jenis/Add/');
    }
}