$(document).on('click', '.copy-to-clipboard', function() {
  /* Get the text field */
  var copyText = $(this).find('.code-content').text();

  /* Copy the text inside the text field */
  navigator.clipboard.writeText(copyText);

  /* Notice copied */
  $(this).find('.notice').text('Copied to clipboard')
})