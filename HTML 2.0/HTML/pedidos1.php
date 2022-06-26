<?php

$idpedido=$_GET['idpedido'];
echo "ID del pedido: ";
echo $idpedido;
echo " ";

$nombre=$_GET['nombre'];
echo "Nombre: ";
echo $nombre;
echo " ";

$descripcion=$_GET['descripcion'];
echo "Descripcion: ";
echo $descripcion;
echo " ";

$direccion=$_GET['direccion'];
echo "Direccion: ";
echo $direccion;
echo " ";

$fragil=$_GET['fragil'];
echo "Fragil: ";
echo $fragil;
echo " ";

$fechacompra=$_GET['fechacompra'];
echo "Fecha de compra: ";
echo $fechacompra;
echo " ";

$fechaentrega=$_GET['fechaentrega'];
echo "Fecha de entrega: ";
echo $fechaentrega;
echo " ";

$legajoconductor=$_GET['legajoconductor'];
echo "Legajo del conductor: ";
echo $legajoconductor;
echo " ";

$nombreconductor=$_GET['nombreconductor'];
echo "Nombre del conductor: ";
echo $nombreconductor;
echo " ";

$apellidoconductor=$_GET['apellidoconductor'];
echo "Apellido del conductor: ";
echo $apellidoconductor;
echo " ";

$dniconductor=$_GET['dniconductor'];
echo "DNI del conductor: ";
echo $dniconductor;
echo " ";

$lic=$_GET['lic'];
echo "Licencia del conductor: ";
echo $lic;
echo " ";

$telefonoconductor=$_GET['telefonoconductor'];
echo "Telefono del conductor: ";
echo $telefonoconductor;
echo " ";

$mailconductor=$_GET['mailconductor'];
echo "Mail del conductor: ";
echo $mailconductor;
echo " ";

$placacamion=$_GET['placacamion'];
echo "Placa del camion: ";
echo $placacamion;
echo " ";

$idpaquetes=$_GET['idpaquetes'];
echo "ID de los paquetes: ";
echo $idpaquetes;
echo " ";

$idconductor=$_GET['idconductor'];
echo "ID del conductor: ";
echo $idconductor;
echo " ";

$destino=$_GET['destino'];
echo "Destino: ";
echo $destino;
echo " ";

$permisos=$_GET['permisos'];
echo "Permisos: ";
echo $permisos;
echo " ";

$instruccion="insert into paquetes(ID, Cliente, Direcciòn, Descripciòn, Fragil, Fecha_de_compra, Fecha_de_entrega) values('$idpedido','$nombre','$descripcion', '$direccion', '$fragil', '$fechacompra', '$fechaentrega')";
$instruccion2="insert into conductor(legajo, nombre, apellido, DNI, licencia, telefono, mail) values('$legajoconductor','$nombreconductor','$apellidoconductor', '$dniconductor', '$lic', '$telefonoconductor', '$mailconductor')";
$instruccion3="insert into camion(numero_de_placa, paquetes, conductor, destino, permiso) values('$placacamion','$idpaquetes','$idconductor', '$destino', '$permisos')";
    $host='localhost';
    $user='root';
    $password='';
    $baseDeDatos='logistica_lotito';

    $conexion=mysqli_connect($host,$user,$password,$baseDeDatos)
    or die('Error al conectarse.');
    $resultado = mysqli_query($conexion,$instruccion);

    $conexion2=mysqli_connect($host,$user,$password,$baseDeDatos)
    or die('Error al conectarse.');
    $resultado2 = mysqli_query($conexion2,$instruccion2);

    $conexion3=mysqli_connect($host,$user,$password,$baseDeDatos)
    or die('Error al conectarse.');
    $resultado3 = mysqli_query($conexion3,$instruccion3);

    mysqli_close($conexion);
    mysqli_close($conexion2);
    mysqli_close($conexion3);

?>