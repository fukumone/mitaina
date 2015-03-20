$(document).ready(function(){
  function showEvaluation(){
    $('.all_evaluation').each(function(index){
      var index = String(index),
          good = $('.all_evaluation').find('.good_' + index),
          bad = $('.all_evaluation').find('.bad_' + index);
      good.text(good.data('count'));
      bad.text(bad.data('count'));
    });
  }

  showEvaluation();

  var button = $('.evaluation_button');

  button.click(function(e){
    var target = $(e.target),
        good_or_bad = target.data('evaluation'),
        prev = target.prev(),
        user_id = prev.data('user-id'),
        comment_id = prev.data('comment-id'),
        count = prev.data('count');

    $.ajax({
      type: "PATCH",
      url: "evaluations/" + good_or_bad,
      data: { user_id: user_id, comment_id: comment_id, count: count },
      success: function(data) {
        prev.text(data.count);
        console.log(data.count);
        showEvaluation();
      }
    });
  });
});
