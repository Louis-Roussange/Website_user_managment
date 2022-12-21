<?php
error_reporting(0);
//=============================
// NO USE OF THE DATABASE HERE 
//=============================
function rand_presentation(){
	$i = rand(0,15);
	switch($i){
		case 0: return "The incredible";
		break;
		case 1: return "The Great";
		break;
		case 2: return "The Ignonimous";
		break;
		case 3: return "The Happy";
		break;
		case 4: return "The Never forgiving";
		break;
		case 5: return "The Not long lasting ";
		break;
		case 6: return "The Legend";
		break;
		case 7: return "The Eternal";
		break;
		case 8: return "Best friend";
		break;
		case 9: return "Worst friend";
		break;
		case 10: return "Good friend";
		break;
		case 11: return "Forgotten friend";
		break;
		case 12: return "Hillarous";
		break;
		case 13: return "Good comedian";
		break;
		case 14: return "The bad guy";
		break;
		case 15: return "Pure Evil";
		break;
		default : return "Super";
		break;
	}
}




?>
