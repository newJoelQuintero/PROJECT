// Toggle abrir/cerrar sidebar
document.querySelector('.sidebar__toggle').addEventListener('click', () => {
    document.querySelector('.sidebar').classList.toggle('open');
});

// Abrir submenús
document.querySelectorAll('.submenu > .sidebar__link').forEach(link => {
    link.addEventListener('click', e => {
        e.preventDefault();
        let parent = link.parentElement;
        parent.classList.toggle('open');
    });
});
