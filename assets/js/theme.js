const burgerMenu = document.getElementById("burger_menu");
const navMenu = document.querySelector(".responsive-header__container");
const windowWidth = window.innerWidth;

if (windowWidth <= 1250 && burgerMenu) {
  burgerMenu.addEventListener("click", () => {
    burgerMenu.classList.toggle("active");
    navMenu.classList.toggle("active");
    document.body.classList.toggle("noscroll");
  });
}
