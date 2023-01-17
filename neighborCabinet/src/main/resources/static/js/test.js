const article = document.querySelectorAll("article");
const naviBtn = document.querySelectorAll("button");
const normalColor = "rgba(255, 255, 255, 0.7)";
const selectedColor = "rgba(216, 191, 216, 1)";



document.addEventListener("wheel", (event) => {
    const clientHeight = window.innerHeight;
    const baseElementTop =
        article[article.length - 1].getBoundingClientRect().top;

    if (event.deltaY > 0) {
        wheelDown(article, baseElementTop, clientHeight);
    }
    if (event.deltaY < 0) {
        wheelUp(article, baseElementTop, clientHeight);
    }
});
for (let i = 0; i < naviBtn.length; i++) {
    naviBtn[i].addEventListener("click", () => {
        for (let j = 0; j < naviBtn.length; j++) {
            naviBtn[j].style.backgroundColor = normalColor;
        }
        article[i].scrollIntoView({ behavior: "smooth" });
        naviBtn[i].style.backgroundColor = selectedColor;
    });
}
function wheelDown(article, baseElementTop, clientHeight) {
    for (let i = 1; i < article.length; i++) {
        if (baseElementTop === clientHeight * (article.length - i)) {
            scrollTo({
                top: clientHeight * i,
                behavior: "smooth",
            });
            for (let j = 0; j < naviBtn.length; j++) {
                naviBtn[j].style.backgroundColor = normalColor;
            }
            naviBtn[i].style.backgroundColor = selectedColor;
        }
    }
}
function wheelUp(article, baseElementTop, clientHeight) {
    for (let i = 0; i < article.length - 1; i++) {
        if (baseElementTop === clientHeight * i) {
            scrollTo({
                top: clientHeight * (article.length - 2 - i),
                behavior: "smooth",
            });
            for (let j = 0; j < naviBtn.length; j++) {
                naviBtn[j].style.backgroundColor = normalColor;
            }
            naviBtn[article.length - 2 - i].style.backgroundColor = selectedColor;
        }
    }
}