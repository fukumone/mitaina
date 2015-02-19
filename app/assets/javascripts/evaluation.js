$(document).ready(function(){
  $('.all_evaluation').each(function(){
    var evaluation_count = $(this).find('.evaluation_count');
    evaluation_count.text(evaluation_count.data('status'));
  });

  var button = $('.evaluation_button');

  button.click(function(e){
    var target = $(e.target);
    var good_or_bad = target.data('evaluation');
    var prev = target.prev();
    var user_id = prev.data('user-id');
    var comment_id = prev.data('comment-id');
    var status = prev.data('status');

    $.ajax({
      type: "PATCH",
      url: "evaluations/" + good_or_bad,
      data: { user_id: user_id, comment_id: comment_id, status: status },
      success: function(data) {
        prev.text(data.status);
      }
    });
  });
});
