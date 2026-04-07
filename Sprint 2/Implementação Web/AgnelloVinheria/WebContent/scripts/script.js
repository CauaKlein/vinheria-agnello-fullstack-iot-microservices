function setAgeVerified() {
  let rememberMe = document.getElementById("rememberMe").checked;

  if (rememberMe) {
    sessionStorage.setItem("ageVerified", "true");
  }

  document.getElementById("agePopup").style.display = "none";
  document.body.classList.remove("no-scroll");
}

window.onload = function () {
  if (sessionStorage.getItem("ageVerified") === "true") {
    document.getElementById("agePopup").style.display = "none";
  } else {
    document.getElementById("agePopup").style.display = "flex";
    document.body.classList.add("no-scroll");
  }
};
