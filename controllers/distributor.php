<?php
if($aksi=='index'){
    $data['distributor']=$db->query($connect,"SELECT * FROM tdistributor");
    $helpers->load_view('distributor/distributor.php',$data);
}
if($aksi=='Add'){
    $helpers->load_view('distributor/adddistributor.php');
}
if($aksi=='save'){
    $nmdist=$_POST['nmdist'];
    $alamat=$_POST['alamat'];
    $notelp=$_POST['notelp'];
    $simpan=$db->qry($connect,"INSERT INTO tdistributor VALUES('','$nmdist','$alamat','$notelp')");
    if($simpan)
        header('location:'.$base_url. 'distributor');
    else{
        header('location:'.$base_url.'distributor/Add/');
    }
}