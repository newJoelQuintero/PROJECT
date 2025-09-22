function initFormHandler(formSelector) {
    const form = document.querySelector(formSelector);

    if (!form) return;

    form.addEventListener("submit", async function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        try {
            let response = await fetch(this.action, {
                method: "POST",
                body: formData
            });

            let result = await response.json();

            if (result.status === "success") {
                Swal.fire({
                    icon: "success",
                    title: "¡Operación exitosa!",
                    text: "El registro fue ingresado con éxito"
                }).then(() => {
                    this.reset(); // limpiar formulario
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: result.message || "No se pudo completar la operación"
                });
            }
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error de conexión",
                text: "Ocurrió un problema al enviar los datos"
            });
        }
    });
}
