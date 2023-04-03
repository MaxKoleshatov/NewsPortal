document.addEventListener('turbolinks:load', function() {
    var category = document.querySelector('.category-select')
    // var category1 = this;

    
    if (category) { category.addEventListener('click', choiseCategory) }
  });

  function choiseCategory() {
  var category1 = this;

   console.log(category1)
    }



  //   $(document).on('turbolinks:load', function(){
  //     $('.questions').on('click', '.edit-question-link', function(e) {
  //         e.preventDefault();
  //         $(this).hide();
  //         var questionId = $(this).data('questionId');
  //         console.log(questionId);
  //         $('form#edit-question-' + questionId).removeClass('hidden');
  //     })
  // });


//   $(document).on('turbolinks:load', function(){
//     $('.category-select').on('click', function(e) {
//         e.preventDefault();
//         var category = $(this).data('categoryId');
//         console.log(category);
//     })
//  });