
//= require jquery3
//= require popper
//= require bootstrap
//= require toastr

function showAlert() {
  var alert_Div = document.getElementById("alert")
  alert_Div.style.display = "block"
  setTimeout(function() {
    alert_Div.style.display = "none"
  }, 2000)
}
showAlert()
