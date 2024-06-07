# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "coreui", to: "https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.1/dist/js/coreui.bundle.min.js"
pin "cropper", to: "https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.min.js"
pin "simplebar", to: "simplebar.js"
pin "stimulus-notification" # @2.2.0
pin "hotkeys-js" # @3.13.7
pin "stimulus-use" # @0.51.3
