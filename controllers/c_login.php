<?php
if($aksi=='index'){
    $data['title']= "Halaman Login";
    $helpers->load_view('login/login.php',$data);
    
}
if($aksi=='Send'){
    echo"Sedang diproses";
}