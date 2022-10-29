<?php
if($aksi=='index'){
    $data['barang']=$db->query($connect,"SELECT * FROM vbarang");
    $helpers->load_view('Barang/barang.php',$data);
}
if($aksi=='add'){
    $data['kdbarang']=$db->qry($connect,"
    SELECT max(idbarang) as kodebarang
    FROM tbarang");
    $helpers->load_view('Barang/addbarang.php',$data);
}