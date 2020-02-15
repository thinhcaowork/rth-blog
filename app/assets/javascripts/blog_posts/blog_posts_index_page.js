$(document).ready(function() {
  $('#sort-blog-posts').change(function() {
    return $.getScript(Routes.root_path({
      sort: $(this).val(),
      page: 1
    }));
  });
});
