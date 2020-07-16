import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count', 'id' ];

  // connect() {
  //   console.log(this.countTarget.innerText);
  // }

  refresh(e) {
    console.log(e.path[11].URL)
    const url = e.path[11].URL
    fetch(url, { headers: { accept: "application/json"} })
    .then(response => response.json())
    .then((data) => {
      console.log(data.post);
      this.countTarget.innerHTML = data.post.cached_votes_up;
    });
  }
}

