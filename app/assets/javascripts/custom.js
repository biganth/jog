$(document).ready(function() {
  $('input.typeahead').typeahead({
    name: 'names',
    prefetch: '../sub_categories/names',
    remote: '../sub_categories/names?q=%QUERY',
    limit: 10
    });
});