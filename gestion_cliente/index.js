const formCliente = document.getElementById("form-cliente");
const listaClientes = document.getElementById("lista-clientes");

formCliente.addEventListener("submit", (e) => {
  e.preventDefault();

  const nombre = document.getElementById("nombre").value;
  const correo = document.getElementById("correo").value;
  const telefono = document.getElementById("telefono").value;

  // Agregar cliente a la lista
  const nuevoCliente = document.createElement("li");
  nuevoCliente.textContent = `${nombre} - ${correo} - ${telefono}`;

  
  const btnEliminar = document.createElement("button");
  btnEliminar.textContent = "Eliminar";
  btnEliminar.addEventListener("click", () => {
    nuevoCliente.parentNode.removeChild(nuevoCliente);
  });

  const btnEditar = document.createElement("button");
  btnEditar.textContent = "Editar";
  btnEditar.addEventListener("click", () => {
    
  });

  nuevoCliente.appendChild(btnEliminar);
  nuevoCliente.appendChild(btnEditar);

  listaClientes.appendChild(nuevoCliente);

  
  formCliente.reset();
});
