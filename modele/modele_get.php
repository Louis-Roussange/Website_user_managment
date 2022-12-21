<?php

include_once('includes/config.php'); // on recupere $con de cette façon.
include_once('modele/modele.php'); // on recupere les fonctions usuelles. 

function get_friends_users ($con, $param){
	$requete = "select * from user where idu in 
	(select id2 from users NATURAL JOIN friends where idu ='$param')";
	$prepare = mysqli_query($con, $requete);
	/*while($row = mysqli_fetch_assoc($prepare))
	{
		$res=$row['idu'];
	}*/
	return $prepare;
} 

// obtenir tous les id de joueurs ayant un nom semblable à...
function get_id_lists_from_nom_player ($con, $name){
	$requete = "select * from user NATURAL JOIN users where ( (NameU LIKE '%$name%') || (LnameU LIKE '%$name%') )";
	$prepare = mysqli_query($con, $requete);
	while($row = mysqli_fetch_assoc($prepare))
	{
		$res=$row['idu']; // TAG des joueurs
	}
	return $res; 
}

// on recupere le boolean 'private'
function get_private_from_user ($con, $id_user){
	$requete = "select `private` from user NATURAL JOIN `is` NATURAL JOIN users where idu = $id_user; ";
	$prepare = mysqli_query($con, $requete);
	return $prepare; // -1 , 0 ou 1 (-1 si erreur requete )
}

// obtenir les idjoueur et id utilisateur d'un joueur
function get_ids_from_player_public ($con, $id_user){
	$requete = "select id, idu, NameU, LnameU, fname, lname from user NATURAL JOIN `is` NATURAL JOIN users where idu = $id_user; ";
	$prepare = mysqli_query($con, $requete);
	return $prepare; //personne = 'user' + 'users'
}

// obtenir les idjoueur et id utilisateur d'un joueur
function get_ids_from_player_private ($con, $id_user){
	$requete = "select id, idu, NameU, LnameU from user NATURAL JOIN `is` NATURAL JOIN users where idu = $id_user; ";
	$prepare = mysqli_query($con, $requete);
	return $prepare; //personne = 'user' + 'users'
}

function get_infos_if_private($con, $id_user){
	$bool = get_private_from_user($con, $id_user);
	switch($bool){
	case 0:  // false => public
		return get_ids_from_player_public ($con, $id_user);
	break;
	case 1:  // true => private
		return get_ids_from_player_private ($con, $id_user);
	break;
	default: //erreur de requete
		return -1;
	break;
	}
}

function get_highest_id_user($con){
	$requete = "SELECT max(idu) from user; ";
	$prepare = mysqli_query($con, $requete);
	return $prepare;
}

?>
