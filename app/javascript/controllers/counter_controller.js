import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  connect() {
    console.log(this.countTarget);
  }

  refresh(event) {
    console.log(event);
    fetch('/posts/149', { headers: { accept: "application/json"} })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
  }
}

