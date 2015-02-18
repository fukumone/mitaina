$(document).ready(function(){
  $('.evaluation_count').text($('.evaluation_count').data('status'));

  $('.evaluation_good_button').click(function(){
    var evaluation_count = $('.evaluation_count');

    var user_id = evaluation_count.data('user-id');
    var comment_id = evaluation_count.data('comment-id');
    var status = evaluation_count.data('status');

    $.ajax({
      type: "PATCH",
      url: "evaluations/good",
      data: { user_id: user_id, comment_id: comment_id, status: status },
      success: function(data) {
        console.log(data)
        $('.evaluation_count').text(data.status);
      }
    });
  });

  $('.evaluation_bad_button').click(function(){
    var evaluation_count = $('.evaluation_count');

    var user_id = evaluation_count.data('user-id');
    var comment_id = evaluation_count.data('comment-id');
    var status = evaluation_count.data('status');

    $.ajax({
      type: "PATCH",
      url: "evaluations/bad",
      data: { user_id: user_id, comment_id: comment_id, status: status },
      success: function(data) {
        console.log(data)
        $('.evaluation_count').text(data.status);
      }
    });
  });
});
