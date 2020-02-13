$(document).ready(function() {
  $('#sort-blog-posts').change(function() {
    return $.ajax({
      url: Routes.root_path({
        sort: $(this).val(),
        page: 1
      }),
      method: 'GET',
      dataType: 'script'
    });
  });
});
