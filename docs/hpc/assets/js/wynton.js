const togglePhi = document.getElementById("toggle-phi");
togglePhi.checked = (localStorage.getItem("phi-mode") == "true");
togglePhi.addEventListener("click", (e) => {
    localStorage.setItem("phi-mode", togglePhi.checked);
});
