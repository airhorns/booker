// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  function toggleForm(enabled) {
    $('.client-details-form').toggle(enabled);
    $('.client-details-form input').attr('disabled', !enabled);
  };

  $('input[type=radio][name="listing[client_managed]"]').change(function() {
    toggleForm(this.value === "1");
  });

  toggleForm($('input[type=radio][name="listing[client_managed]"]').value() === "1");
});
