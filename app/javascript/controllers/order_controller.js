import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="order"
export default class extends Controller {
    static targets = ["price", "quantity", "totalAmount", "items", "template", "productSelect"];

    connect() {
        console.log("Order controller connected")
    }

    updatePrice(event) {
        console.log(event)
        const item = event.target.closest(".order-item"); // Encuentra el contenedor del item actual
        console.log("Item", item);
        const selectedOption = event.target.options[event.target.selectedIndex];
        console.log("Selected option", selectedOption);
        const price = selectedOption.dataset.price || 0;
        console.log("Price", price);
        item.querySelector("[data-order-target='price']").value = price; // Cambia solo en este item

        // Recalcula el total si ya hay cantidad ingresada
        this.calculateTotal({ target: item.querySelector("[data-order-target='quantity']") });
    }

    calculateTotal(event) {
        const item = event.target.closest(".order-item")
        const quantity = parseFloat(item.querySelector("[data-order-target='quantity']").value) || 0
        const price = parseFloat(item.querySelector("[data-order-target='price']").value) || 0
        const total = quantity * price

        item.querySelector("[data-order-target='totalAmount']").value = total.toFixed(2)
    }

    addItem(event) {
        event.preventDefault()

        const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())

        this.itemsTarget.insertAdjacentHTML('beforeend', content)
    }

    removeItem(event) {
        event.preventDefault()

        const item = event.target.closest(".order-item")

        if (item.dataset.newRecord == "true") {
            item.remove()
        } else {
            item.querySelector("input[name*='_destroy']").value = 1
            item.style.display = 'none'
        }
    }
}
