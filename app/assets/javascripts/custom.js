$(document).ready(function() {
  $('input.typeahead').typeahead({
    name: 'names',
    prefetch: '../sub_categories/names',
    remote: '../sub_categories/names?q=%QUERY',
    limit: 10
    });
});



jQuery("#search_field").autocomplete({
  source: "/listings/search",
  minLength: 2,
  select: function(event, ui){
    start_search=false;
    $('search_item_id').value = ui.item.id;
    $('search_item_type').value = ui.item.klass;
    $('search_form').submit();
  }
});
