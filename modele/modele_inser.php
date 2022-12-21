<?php
error_reporting(0);
include_once('includes/config.php'); // on recupere $con de cette façon.
include_once('modele/modele.php');   // on recupere les fonctions usuelles. 
include_once('modele/modele_get.php'); // on accede au modele_get

function create_profile($con, $name, $lname, $picture, $id){
	$idu = get_highest_id_user($con) + 1 ;
	$requete = "INSERT INTO `user` (`idu`, `NameU`, `LnameU`, `image`) VALUES ($idu, '$name', '$lname', '$picture');
				INSERT INTO `is` (`id`, `idu`) VALUES ($id, $idu); ";
	$prepare = mysqli_query($con, $requete);
	return $prepare;
	
}

?>
