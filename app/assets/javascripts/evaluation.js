$(document).ready(function(){
  var button = $('.evaluation_button');

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
        var className = prev.attr('class').split(' ')[1],
            good_or_bad;

        if (className.match(/^good_/)){
          good_or_bad = className.replace(/good/, '.bad');
          $(good_or_bad).text(data.count - 1);
        }else{
          good_or_bad = className.replace(/bad/, '.good');
          $(good_or_bad).text(data.count - 1);
        }
        prev.text(data.count);
      }
    });
  });
});
