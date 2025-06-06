import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "submit"]

    connect() {
        this.toggleButton()
    }

    toggleButton() {
        this.submitTarget.classList.toggle("hidden", !this.inputTarget.files.length)
    }
}
