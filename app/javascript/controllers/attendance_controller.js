import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["rfid", "scannerPlaceholder"]

  connect() {
    const placeholderId = this.element.dataset.placeholderId
    const inputId = this.element.dataset.inputId
    const submitAfterScan = this.element.dataset.submitAfterScan === 'true'
    const placeholder = document.getElementById(placeholderId)
    const input = document.getElementById(inputId)

    placeholder.classList.remove("d-none")
    document.onkeydown = (event) => this.handleScan(event, placeholder, input, submitAfterScan)
  }

  handleScan(event, placeholder, input, submitAfterScan) {
    if (this.rfid_value === undefined) this.rfid_value = ""
    if (event.key === 'Enter') {
      event.preventDefault()
      placeholder.classList.add("d-none")
      input.value = this.rfid_value
      this.rfid_value = ""
      document.getElementById("rfid_input_placeholder")?.classList.remove("d-none")
      document.onkeydown = null

      if (submitAfterScan) {
        const form = input.closest("form")
        form.setAttribute("data-turbo", "false")
        form.submit()
        form.removeAttribute("data-turbo")
      }
    } else {
      this.rfid_value += event.key
    }
  }
}
