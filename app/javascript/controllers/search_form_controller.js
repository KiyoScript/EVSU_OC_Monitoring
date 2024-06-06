import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
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
