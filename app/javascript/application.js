// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "coreui"

document.addEventListener('turbo:load', () => coreui.Sidebar.sidebarInterface(document.querySelector('#sidebar')))
