import { Controller } from "stimulus";
import httpClient from "../lib/http/client";

export default class extends Controller {
  static targets = ["btn"];
  static values = {
    liked: Boolean,
    courseId: Number,
  };

  connect() {
    if (this.likedValue) {
      this.targets.classList.add("favorited");
    }
  }

  like() {
    const courseID = this.courseIdValue;
    const url = `/api/v1/courses/${courseID}/like`;
    httpClient.post(url).then(({ data }) => {
      if (data.status === "like") {
        this.btnTarget.classList.add("favorited");
      } else {
        this.btnTarget.classList.remove("favorited");
      }
    });
  }
}
