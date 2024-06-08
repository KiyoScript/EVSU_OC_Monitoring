import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="redirect-back"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      window.history.back();
    }, 10000);
  }
}
