$(document).ready(() => {
  $(document).on("click", "#jq-add-contact", () => {
    $("#jq-add-contact").attr('disabled','disabled');
    $("#jq-new-contact").removeClass('hidden');
  })
});