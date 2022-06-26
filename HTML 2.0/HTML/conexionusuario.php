<?php

$usuario=$_GET['usuario'];
echo "Usuario: ";
echo $usuario;
echo " ";

$nombre=$_GET['nombre'];
echo "Nombre: ";
echo $nombre;
echo " ";

$apellido=$_GET['apellido'];
echo "Apellido: ";
echo $apellido;
echo " ";

$telefono=$_GET['telefono'];
echo "Telefono: ";
echo $telefono;
echo " ";

$contrasenia=$_GET['contrasenia'];
echo "Contraseña: ";
echo $contrasenia;
echo " ";

$contrasenia2=$_GET['contrasenia2'];
echo "Contraseña repetida: ";
echo $contrasenia2;
echo " ";

$instruccion="insert into registro(usuario, nombre, apellido, telefono, contraseña, confirmar_contraseña) values('$usuario','$nombre','$apellido', '$telefono', '$contrasenia', '$contrasenia2')";

    
    $host='localhost';
    $user='root';
    $password='';
    $baseDeDatos='usuario';

    $conexion=mysqli_connect($host,$user,$password,$baseDeDatos)
    or die('Error al conectarse.');

    $resultado = mysqli_query($conexion,$instruccion);

 mysqli_close($conexion);

?>