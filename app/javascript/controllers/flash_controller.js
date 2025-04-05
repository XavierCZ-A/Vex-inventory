import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["flash"]
    connect() {
        setTimeout(() => {
            this.element.remove();
        }, 3000);
    }
}
