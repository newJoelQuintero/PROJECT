import './bootstrap';
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.css";
import './menu';

document.addEventListener("DOMContentLoaded", () => {
    flatpickr("input[name=hora_cita]", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        time_24hr: true,
    });
});
