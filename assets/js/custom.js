const url = "https://btg-dev.com/chez-olympe/wp-json/";
const burgerMenu = document.getElementById("burger_menu");
const navMenu = document.querySelector(".responsive-header__container");
const windowWidth = window.innerWidth;
const App = document.getElementById("App");
const rightTransform = document.getElementById("right-transform");
const leftTransform = document.getElementById("left-transform");
const productCategoiresFront = document.querySelector(
  "#product-categories__front > .large-container"
);
const taillesReturn = document.querySelectorAll(
  "#group_1 > li > label > .radio-label"
);
const seeAll = document.getElementById("see-all");
const colorInput = document.querySelectorAll(
  ".color-controller > li > label > input"
);
const colorReturn = document.querySelector(".color-return");
const plus = document.getElementById("plus");
const minus = document.getElementById("minus");
const quantity = document.getElementById("quantity_wanted");
const entretienHandler = document.getElementById("entretien-handler");
const entretienContent = document.getElementById("entretien-content");
const inputContainer = document.querySelectorAll(".input-container");
const spanColor = document.querySelectorAll(
  ".input-container > label > .color"
);
const ratingLabel = document.querySelector(".criterion-rating > label");
const entretien = document.getElementById("entretien");
const showEntretien = document.getElementById("show-entretien");
const showStrong = document.getElementById("show-strong");
const strongAt = document.getElementById("strong-at");
const strongAtHandler = document.getElementById("strong-at__handler");
const strongAtContent = document.getElementById("strong-at__content");
const ingredients = document.getElementById("ingredients");
const showIngredients = document.getElementById("show-ingredients");
const ingredientsHandler = document.getElementById("ingredients-handler");
const ingredientsContent = document.getElementById("ingredients-content");
const showCat = document.getElementById("show-cat");
const subCat = document.getElementById("sub-cat");
const catSubMenuContainer = document.querySelector(
  ".category-sub-menu__container"
);

const isSameTaille = () => {
  let tailles = document.querySelector(".taille-texte > .color-return");
  console.log(tailles.innerText);
  for (const tailleReturn of taillesReturn) {
    tailleReturn.classList.remove("active");
    if (tailles.innerText === tailleReturn.innerText) {
      tailleReturn.classList.add("active");
    }
  }
};

if (ratingLabel) {
  ratingLabel.textContent = "Votre note : ";
}

if (windowWidth <= 1250 && burgerMenu) {
  burgerMenu.addEventListener("click", () => {
    burgerMenu.classList.toggle("active");
    navMenu.classList.toggle("active");
    document.body.classList.toggle("noscroll");
  });
}

if (App && productCategoiresFront) {
  let data = [];
  let sliderArray = [];
  let categories = [];

  class productCategories {
    constructor(image, title, text, btn) {
      this.image = image;
      this.title = title;
      this.text = text;
      this.btn = btn;
    }

    createLeftSide() {
      const leftSide = document.createElement("div");
      leftSide.classList.add("product-categories__left-side");
      leftSide.appendChild(this.createImage());
      return leftSide;
    }

    createRightSide() {
      const rightSide = document.createElement("div");
      const leafContainer = document.createElement("div");
      leafContainer.classList.add("product-categories__leaf-container");
      rightSide.classList.add("product-categories__right-side");
      rightSide.appendChild(leafContainer);
      rightSide.appendChild(this.createTitle());
      rightSide.appendChild(this.createText());
      rightSide.appendChild(this.createBtn());
      return rightSide;
    }

    createImage() {
      const image = document.createElement("img");
      image.classList.add("product-categories__img");
      image.src = this.image.url;
      image.alt = this.image.alt;
      return image;
    }

    createTitle() {
      const title = document.createElement("h2");
      title.classList.add("product-categories__title");
      title.textContent = this.title;
      return title;
    }

    createText() {
      const text = document.createElement("p");
      text.classList.add("product-categories__text");
      text.textContent = this.text;
      return text;
    }

    createBtn() {
      const btn = document.createElement("a");
      btn.classList.add("product-categories__btn");
      btn.setAttribute("href", this.btn.url);
      btn.textContent = this.btn.title;
      return btn;
    }

    createProductCategories() {
      const productCategories = document.createElement("article");
      productCategories.classList.add("product-categories");
      productCategories.appendChild(this.createLeftSide());
      productCategories.appendChild(this.createRightSide());
      return productCategories;
    }
  }

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
    await fetch(`${url}better-rest-endpoints/v1/options/acf`)
      .then((response) => response.json())
      .then((res) => {
        data = res.slider;
        categories = res.categories_shop;
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

    categories.forEach((category) => {
      const productCategory = new productCategories(
        category.image,
        category.titre,
        category.texte,
        category.lien
      ).createProductCategories();
      productCategoiresFront.appendChild(productCategory);
    });
  };

  const handleData = async () => {
    await getData();
    let size = sliderArray.length;
    let a = 0;
    let b = 1;
    let slide = sliderArray.slice(a, b);
    let bulletPoint = [];

    for (let i = 0; i < size; i++) {
      bulletPoint.push(i);
    }

    createBulletPoint(bulletPoint, size, slide, 0);

    App.appendChild(slide[0]);
  };

  const handleSlide = (bulletPoint, bullet, size, slide) => {
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
        handleSlide(bulletPoint, bullet, size, slide);
      });
    });

    App.appendChild(bulletContainer);
  };

  const slideImage = (bulletPoint, a, b, size, slide) => {
    slide = sliderArray.slice(a, b);
    App.innerHTML = "";
    slide.forEach((item) => {
      App.appendChild(item);
    });
    createBulletPoint(bulletPoint, size, slide, a);
  };

  handleData();
}

if (seeAll) {
  const paragraph = document.querySelectorAll(".product-description > p");

  seeAll.addEventListener("click", () => {
    paragraph.forEach((item) => {
      if (item !== seeAll) {
        item.classList.toggle("active");
      }

      if (item.classList.contains("active")) {
        seeAll.textContent = "Voir moins";
      } else {
        seeAll.textContent = "En savoir plus";
      }
    });
  });
}

if (taillesReturn) {
  isSameTaille();
}

document.body.addEventListener("change", () => {
  if (taillesReturn) {
    isSameTaille();
  }
});

if (colorInput && colorReturn) {
  const removeBorder = (style = "none", index = null) => {
    for (element of inputContainer) {
      element.style.border = "none";
      element.style.borderColor = "transparent !important";
    }
    if (style !== "none") {
      inputContainer[index].style.border = `${style}`;
    }
  };

  for (let i = 0; i < colorInput.length; i++) {
    removeBorder();
    colorInput[i].addEventListener("click", (e) => {
      removeBorder(`1px solid ${spanColor[i].style.backgroundColor}`, i);
      colorReturn.textContent = e.target.title;
    });
  }
}

if (plus && minus && quantity) {
  const handleQuantity = (operator) => {
    if (operator === "plus") {
      quantity.value = Number(quantity.value) + 1;
    } else if (operator === "minus") {
      if (quantity.value > 1) {
        quantity.value = Number(quantity.value) - 1;
      }
    }
  };

  plus.addEventListener("click", () => {
    handleQuantity("plus");
  });

  minus.addEventListener("click", () => {
    handleQuantity("minus");
  });
}

if (entretien && showEntretien.innerText === "Oui") {
  entretien.classList.add("show");
}

if (strongAt && showStrong.innerText === "Oui") {
  strongAt.classList.add("show");
  showEntretien.innerText === "Oui"
    ? strongAt.classList.add("no-border-top")
    : null;
}

if (entretienHandler && entretienContent) {
  let isActive = false;
  entretienHandler.addEventListener("click", () => {
    entretienContent.classList.toggle("active");
    isActive = !isActive;

    if (isActive) {
      entretienHandler.innerHTML = "Entretien <span>-</span>";
    } else {
      entretienHandler.innerHTML = "Entretien <span>+</span>";
    }
  });
}

if (strongAtHandler && strongAtContent) {
  let isActive = false;
  strongAtHandler.addEventListener("click", () => {
    strongAtContent.classList.toggle("active");
    isActive = !isActive;

    if (isActive) {
      strongAtHandler.innerHTML = "Points forts <span>-</span>";
    } else {
      strongAtHandler.innerHTML = "Points forts <span>+</span>";
    }
  });
}

if (ingredients && showIngredients.innerText === "Oui") {
  ingredients.classList.add("show");
  showEntretien.innerText === "Oui" || showStrong.innerText === "Oui"
    ? ingredients.classList.add("no-border-top")
    : null;
}

if (ingredientsHandler && ingredientsContent) {
  let isActive = false;
  ingredientsHandler.addEventListener("click", () => {
    ingredientsContent.classList.toggle("active");
    isActive = !isActive;

    if (isActive) {
      ingredientsHandler.innerHTML = "Ingredients <span>-</span>";
    } else {
      ingredientsHandler.innerHTML = "Ingredients <span>+</span>";
    }
  });
}

if (showCat && subCat) {
  showCat.addEventListener("click", () => {
    subCat.classList.toggle("show");
    if (subCat.classList.contains("show")) {
      catSubMenuContainer.style.height = `calc(50px + ${subCat.offsetHeight}px)`;
    } else {
      setTimeout(() => {
        catSubMenuContainer.style.height = "fit-content";
      }, 500);
    }
  });
}
