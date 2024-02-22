const usuario = document.getElementById("usuario");
const contrasena = document.getElementById("contrasena");
const botonEnviar = document.getElementById("botonEnviar");
const darkMode = document.getElementById("btn");
const usersList = [];

function enviar(e){
    e.preventDefault();
    botonEnviar.addEventListener('click',enviar);
}

function dark(e){
    e.preventDefault();
    let formu = document.getElementsByTagName('form');
    formu[0].classList.toggle('mode-dark');
    if (darkMode.textContent == 'Dark mode') {
        darkMode.textContent = 'Normal mode';
    } else {
        darkMode.textContent = 'Dark mode';
    }
}

darkMode.addEventListener('click',dark);

function usuarioB(e){
    e.preventDefault();
    if(usuario.value.length <= 4){
        alert("Nombre de usuario incompleto");
    }
}
botonEnviar.addEventListener('click',usuarioB);


function accederUsuario() {
    
    const nombreUsuario = document.getElementById("usuario").value;
    const contrasena = document.getElementById("contrasena").value;
  
    const usuario = {
      nombreUsuario:"kliuvertgarciaquinonez@gmail.com",
      contrasena:"garcia12345",
    };
  
    if (usuario.nombreUsuario === nombreUsuario && usuario.contrasena === contrasena) {
      alert("¡Usuario accedido correctamente!");
    } else {
      // Mostrar un mensaje de error
      alert("Usuario o contraseña incorrectos");
    }
  }
  

  document.getElementById("botonEnviar").addEventListener("click", accederUsuario);