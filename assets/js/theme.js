const burgerMenu = document.getElementById("burger_menu");
const navMenu = document.querySelector(".responsive-header__container");
const windowWidth = window.innerWidth;
const App = document.getElementById("App");
const rightTransform = document.getElementById("right-transform");
const leftTransform = document.getElementById("left-transform");

if (windowWidth <= 1250 && burgerMenu) {
  burgerMenu.addEventListener("click", () => {
    burgerMenu.classList.toggle("active");
    navMenu.classList.toggle("active");
    document.body.classList.toggle("noscroll");
  });
}

if (App) {
  let data = [];
  let sliderArray = [];

  class Slider {
    constructor(title, text, btn, img) {
      this.title = title;
      this.text = text;
      this.btn = btn;
      this.img = img;
    }

    createTitle() {
      const title = document.createElement("h2");
      title.classList.add("slider__title");
      title.textContent = this.title;
      return title;
    }

    createText() {
      const text = document.createElement("p");
      text.classList.add("slider__text");
      text.textContent = this.text;
      return text;
    }

    createBtn() {
      const btn = document.createElement("a");
      btn.classList.add("slider__btn");
      btn.setAttribute("href", this.btn.url);
      btn.textContent = this.btn.title;
      return btn;
    }

    createImg() {
      const img = document.createElement("img");
      img.classList.add("slider__img");
      img.src = this.img.url;
      img.alt = this.img.alt;
      return img;
    }

    createLeftSide() {
      const leftSide = document.createElement("div");
      const contentContainer = document.createElement("div");
      contentContainer.classList.add("slider__content-container");
      leftSide.classList.add("slider__left-side");
      contentContainer.appendChild(this.createTitle());
      contentContainer.appendChild(this.createText());
      contentContainer.appendChild(this.createBtn());
      leftSide.appendChild(contentContainer);
      return leftSide;
    }

    createRightSide() {
      const rightSide = document.createElement("div");
      rightSide.classList.add("slider__right-side");
      rightSide.appendChild(this.createImg());
      return rightSide;
    }

    createSlider() {
      const slider = document.createElement("div");
      slider.classList.add("slider");
      slider.appendChild(this.createLeftSide());
      slider.appendChild(this.createRightSide());
      return slider;
    }
  }

  const getData = async () => {
    await fetch(
      "https://chezolympe.test/wp-json/better-rest-endpoints/v1/options/acf"
    )
      .then((response) => response.json())
      .then((res) => {
        data = res.slider;
      });

    data.forEach((item) => {
      const slider = new Slider(
        item.titre,
        item.text,
        item.lien,
        item.img
      ).createSlider();
      sliderArray.push(slider);
    });
  };

  const handleData = async () => {
    await getData();
    let size = sliderArray.length;
    let a = 0;
    let b = 1;
    let slide = sliderArray.slice(a, b);
    let bulletPoint = [];
    console.log(size);

    for (let i = 0; i < size; i++) {
      bulletPoint.push(i);
    }

    createBulletPoint(bulletPoint, size, slide, 0);

    App.appendChild(slide[0]);
  };

  const createBulletPoint = (bulletPoint, size, slide, id) => {
    const bulletContainer = document.createElement("div");
    bulletContainer.classList.add("slider__bullet-container");

    bulletPoint.forEach((item) => {
      const bullet = document.createElement("div");
      bullet.classList.add("slider__bullet");
      bullet.textContent = item;
      bulletContainer.appendChild(bullet);
      if (bullet.textContent == id) {
        bullet.classList.add("active");
      }

      bullet.addEventListener("click", () => {
        leftTransform.classList.add("active");
        rightTransform.classList.add("active");

        setTimeout(() => {
          rightTransform.classList.remove("active");
        }, 1000);

        setTimeout(() => {
          leftTransform.classList.remove("active");
        }, 1200);

        setTimeout(() => {
          slideImage(
            bulletPoint,
            Number(bullet.textContent),
            Number(bullet.textContent) + 1,
            size,
            slide
          );
        }, 800);
      });
    });

    App.appendChild(bulletContainer);
  };

  const slideImage = (bulletPoint, a, b, size, slide) => {
    console.log(bulletPoint.length);
    slide = sliderArray.slice(a, b);
    App.innerHTML = "";
    slide.forEach((item) => {
      App.appendChild(item);
    });
    createBulletPoint(bulletPoint, size, slide, a);
  };

  handleData();
}
