$(document).on("click", "#jq-add-contact", () => {
  $("#jq-add-contact").attr('disabled','disabled');
  $("#jq-new-contact").removeClass('hidden');
  $('#new_contact').submit((e) => {
    e.preventDefault();
    e.stopImmediatePropagation();
    var params = $("#new_contact").serialize();
    $.ajax({
      type: "POST",
      url: '/contacts',
      data: params, // serializes the form's elements.
      success: (response) => {
        removeErrorMessage();
        appendNewContact(response);
        wipeFormFields();
      },
      error: (response) => {
        var displayError = response.responseJSON.errors || ["An unknown error has ocurred"]
        renderErrorMessage(displayError);
      }
    });
  });
});


var appendNewContact = (contact) => {
  $('#jq-contact-index').append(`<li class="contact-list-item">${contact.name} - ${contact.email}</li>`)
};

var wipeFormFields = () => {
  $(".jq-contact-form-field").first().val('');
  $(".jq-contact-form-field").last().val('');
};

var renderErrorMessage = (displayError) => {
  $('#new-contact-alert').removeClass('hidden');
  $('#new-contact-alert').text(displayError)
};

var removeErrorMessage = () => {
  $('#new-contact-alert').addClass('hidden');
  $('#new-contact-alert').text("")
};