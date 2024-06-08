import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="report-printer"
export default class extends Controller {
  print() {
    document.getElementById("navbar").classList.add("d-none")
    document.getElementById("printBtn").classList.add("d-none")
    window.print()
    document.getElementById("navbar").classList.remove("d-none")
    document.getElementById("printBtn").classList.remove("d-none")
  }
}
