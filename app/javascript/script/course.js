// import httpClient from "../lib/http/client";

// document.addEventListener("turbolinks:load", function (e) {
//   const likeBtn = document.querySelector("#like-btn");

//   likeBtn &&
//     likeBtn.addEventListener("click", () => {
//       const courseID = likeBtn.dataset.id;
//       const url = `/api/v1/courses/${courseID}/like`;
//       httpClient.post(url).then(({ data }) => {
//         if (data.status === "like") {
//           likeBtn.classList.add("favorited");
//         } else {
//           likeBtn.classList.remove("favorited");
//         }
//       });
//     });
// });
