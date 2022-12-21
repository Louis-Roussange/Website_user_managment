<?php session_start();
include_once('includes/config.php');
include_once('modele/modele_get.php');
include_once('modele/modele.php');
if (strlen($_SESSION['id']==0)) {
  header('location:logout.php');
  } else{ 
	  $userid=$_SESSION['id']; 
	  $message = "";
  
?>			<!--start of file -->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Main Menu | Registration and Login System</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
      <?php include_once('includes/navbar.php');?>
        <div id="layoutSidenav">
          <?php include_once('includes/sidebar.php');?>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Account and details</h1>
                        <hr />
           
    
 <ol class="breadcrumb mb-4">
<li class="breadcrumb-item active">add friends :</li>
</ol>    
   <form method="post" action="#">
	 <div class="row" >
         <div class="col-xl-5 col-md-6" >
          <div class="card bg-primary text-white mb-4">
			<div class="card-body"> 
          <input type="text" name="name" placeholder=" Search by name " />
          <input type="number" name="TAG" min="0001" max ="9999" placeholder="0000"; />
			<br />
			</div>
         <div class="card-footer d-flex align-items-center justify-content-between"> 
			<center><input type="submit" value="Send Friend Request" /></center>
			<?php if(isset($message)) { ?>
			<p style="background-color: red;"><?= $message ?></p>
			<?php } ?>
		  </div>
		 </div>
		</div>
		</div>
    </form>
    
<?php
	// RESULTATS DE LA REQUETE 
		if(isset($_POST["TAG"]) && isset($_POST["name"])){ // 1e cas
			
		}else if(isset($_POST["name"])){				   // 2e cas
			$user_list = get_id_lists_from_nom_player ($con, $name);
		 if($user_list == null || count($user_list) == 0) 
		 {
			$message .= "Pas trouvé!";
		 } 
		 foreach($user_list as $id_user){
		 get_infos_if_private($con, $id_user);
				 }
		}else if(isset($_POST["TAG"])){		   			  // 3e cas
			
		}
		
?>
    <!-- utilisateurs à ajouter avec un Limit 10 -->   
    
    
		<!-- AFFICHAGE DE LA LISTE D'AMIS -->           
<ol class="breadcrumb mb-4">
<li class="breadcrumb-item active">Friend-List :</li>
</ol>         
<?php 
$query = get_friends_users($con, $userid);
foreach(($result=mysqli_fetch_all($query, MYSQLI_ASSOC)) as $result)
	{?>  
							<div class="row" >
                            <div class="col-xl-5 col-md-6" >
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body"> <?=rand_presentation() ?> <?php echo $result['NameU']." ".$result['LnameU'];?></div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="profile.php">View Statistics</a>
                                        <a class="small text-white stretched-link" href="creations.php">View Creations</a>
                                        <a class="small text-white stretched-link" href="welcome.php">Send Invitation</a>
                                          <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            
<?php } ?>   <!-- FIN DE L4 AFFICHAGE -->             
                          
                        
                        

						</div>
              
                        </div>
                   
                    </div>
                </main>
          <?php include('includes/footer.php');?>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>



<?php } ?>  <!-- end of file -->
