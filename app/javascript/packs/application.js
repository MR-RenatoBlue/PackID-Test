// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import "../stylesheets/application";
$(document).on("turbolinks:load", function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
  // autofill in the format "ff,ff"
  $('[data-behavior="price"').on("keyup", function() {
    let valor = $(this).val();
    let v = valor.replace(/\D/g,'');
    v = (v/100).toFixed(2) + '';
    //v = v.replace(".", ",");
    v = v.replace(/(\d)(\d{3})(\d{3}),/g, "$1.$2.$3,");
    v = v.replace(/(\d)(\d{3}),/g, "$1.$2,");
    valor = v;
    $(this).val(v);
    
  })
})
var jQuery = require('jquery');
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

//toastr for notifications
window.toastr = require('toastr');
//prevent caching toastr
$(document).on("turbolinks:before-cache", function() {
  const flash_message_element = $(".toastr-top-right")
  if (flash_message_element) {
    flash_message_element.remove()
  }
})
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

