// app/javascript/controllers/search_form_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.element.addEventListener("input", this.handleInput.bind(this));
    this.element.addEventListener("submit", this.handleSubmit.bind(this));
  }

  handleInput() {
    this.element.submit();
  }

  handleSubmit(event) {
    event.preventDefault();
    this.element.submit();
  }
}
