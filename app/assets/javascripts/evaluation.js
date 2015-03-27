$(document).ready(function(){
  var button = $('.evaluation_button');

  function showEvaluation(){
    var all_evaluation = $('.all_evaluation');

    all_evaluation.each(function(index){
      var index = String(index),
          good = all_evaluation.find('.good_' + index),
          bad = all_evaluation.find('.bad_' + index);
      good.text(good.data('goodCount'));
      bad.text(bad.data('badCount'));
    });
  }

  showEvaluation();

  button.click(function(e){
    var target = $(e.target),
        good_or_bad = target.data('evaluation'),
        prev = target.prev(),
        user_id = prev.data('user-id'),
        comment_id = prev.data('comment-id'),
        className = prev.attr('class').split(' ')[1],
        goodClass,
        badClass,
        good_count,
        bad_count;

        if (className.match(/^good_/)){
          badClass = className.replace(/good/, '.bad');
          bad_count = $(badClass).data('badCount');
        }else{
          goodClass = className.replace(/bad/, '.good');
          good_count = $(goodClass).data('goodCount');
        }

    $.ajax({
      type: "PATCH",
      url: "evaluations/" + good_or_bad,
      data: { user_id: user_id, comment_id: comment_id, good_count: good_count, bad_count: bad_count },
      success: function(data) {

        if (className.match(/^good_/)){
          prev.text(data.good_count);
          $(badClass).text(data.bad_count);
        }else{
          prev.text(data.bad_count);
          $(goodClass).text(data.good_count);
        }
      }
    });
  });
});
