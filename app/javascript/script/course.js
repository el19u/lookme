import axios from "axios";

document.addEventListener("turbolinks:load", function (e) {
  const likeBtn = document.querySelector(".like-btn");

  likeBtn &&
    likeBtn.addEventListener("click", () => {
      // console.log(axios);
      const url = "https://randomuser.me/api/?results=5";
      axios.get(url).then(({ data }) => {
        likeBtn.classList.add("favorited");
        data.results.forEach((u) => {
          console.log(u.email);
        });
      });
    });
});
