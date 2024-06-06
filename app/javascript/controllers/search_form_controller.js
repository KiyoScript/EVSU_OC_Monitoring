import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener("click", this.autoFocus.bind(this));
    this.element.addEventListener("submit", this.handleSubmit.bind(this));
  }

  autoFocus(event) {
    const input = this.element.querySelector('input');
    if (input) {
      input.focus();
    }
  }

  handleSubmit(event) {
    event.preventDefault();
    this.element.submit();
  }
}
