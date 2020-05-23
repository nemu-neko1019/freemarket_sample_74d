$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <div class="edit-btn${count}">編集</div>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }
    function buildFile(id){
      var html =`
      <input class="hidden-field" type="file" name="item[item_images_attributes][${id}][image]" id="item_item_images_attributes_${id}_image">
      <input name="item[item_images_attributes][${id}][_destroy]" type="hidden" value="0">
      <input class="hidden-checkbox" type="checkbox" value="1" name="item[item_images_attributes][${id}][_destroy]" id="item_item_images_attributes_${id}__destroy">
      `
      return html;
    }
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.label-content').hide();
      }
    }
    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    $(".edit-btn0").on("click", function(){
      $("#item_item_images_attributes_0_image").trigger("click");
    });
    $(".edit-btn1").on("click", function(){
      $("#item_item_images_attributes_1_image").trigger("click");
    });
    $(".edit-btn2").on("click", function(){
      $("#item_item_images_attributes_2_image").trigger("click");
    });
    $(".edit-btn3").on("click", function(){
      $("#item_item_images_attributes_3_image").trigger("click");
    });

    $(".delete-btn0").on("click", function(){
      $("#item_item_images_attributes_0__destroy").prop("checked", true);
    })
    $(".delete-btn1").on("click", function(){
      $("#item_item_images_attributes_1__destroy").prop("checked", true);
    })
    $(".delete-btn2").on("click", function(){
      $("#item_item_images_attributes_2__destroy").prop("checked", true);
    })
    $(".delete-btn3").on("click", function(){
      $("#item_item_images_attributes_3__destroy").prop("checked", true);
    })


    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 4) { 
          $('.label-content').hide();
        }
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        setLabel();
        if(count < 4){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
        var count2 = $(".prev-content").length;
        if (0 == count2 < 4) {
          var filebox = buildFile(count2);
          $(".prev-content").append(filebox);
        }
      }
    });

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 4){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

        }
      } else {

        $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel();
        if(id < 4){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
    });
  });
});
