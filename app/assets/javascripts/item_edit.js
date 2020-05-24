$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(count) {
      var html =  `<div class="preview-box" id="preview-box__${count}">
      <div class="upper-box">
      <img src="" alt="preview">
      </div>
      <div class="lower-box">
      <div class="update-box">
      <div class="edit-btn" id="edit-btn_${count}">
      編集
      </div>
      </div>
      <div class="delete-box" id="delete_btn_${count}">
      <div class="delete-btn">
      削除
      </div>
      </div>
      </div>
      </div>`
      return html;
    };




    // function buildFile(num){
    //   var html =`
    //   <input class="hidden-field" type="file"
    //   name="item[item_images_attributes][${num}][image]"
    //   id="product_images_attributes_${num}_image"><br>
    //   <input class="hidden-checkbox" type="checkbox" value="1" name="item[item_images_attributes][${id}][_destroy]" id="item_images_attributes_${id}__destroy">
    //   </div>`;
    //   return html;
    // };

    // <div data-index="${num}" class="js-file_group">


    // <input class="hidden-field" type="file" name="item[item_images_attributes][${id}][image]" id="item_images_attributes_${id}_image">
    // <input name="item[item_images_attributes][${id}][_destroy]" type="hidden" value="0">
    // <input class="hidden-checkbox" type="checkbox" value="1" name="item[item_images_attributes][${id}][_destroy]" id="item_images_attributes_${id}__destroy">



    if (window.location.href.match(/\/items\/\d/)){
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.edit-btn').each(function(index, box){
        $(box).attr('id', `edit-btn_${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 4) {
        $('.label-content').hide();
      }
      if (window.location.href.match(/edit$/)){
        var prevContent = $('.label-content').prev();
        labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
        $('.label-content').css('width', labelWidth);      
      }
    }


    function setLabel() {
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }


    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`,for: `item_item_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          $('.prev-content').append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 4) { 
          $('.label-content').hide();
        }

        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        console.log("ssss")
        $("#edit-btn_0").on("click", function(){
          console.log("33333")
          $("#item_item_images_attributes_0_image").trigger("click");
        });
        $("#edit-btn_1").on("click", function(){
          $("#item_item_images_attributes_1_image").trigger("click");
        });
        $("#edit-btn_2").on("click", function(){
          $("#item_item_images_attributes_2_image").trigger("click");
        });
        $("#edit-btn_3").on("click", function(){
          $("#item_item_images_attributes_3_image").trigger("click");
        });  


        setLabel();
        if(count < 4){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_item_images_attributes_${count}_image`});
          // var imagefile = buildFile(count)
          // $(".hidden-content").append(imagefile)
        }
      }
    });

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();
      $(`#item_images_attributes_${id}__destroy`).prop("checked", true);

      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 3) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 4){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_item_images_attributes_${id}_image`});

        }
      } else {

        if (count == 3) {
          $('.label-content').show();
        }

        setLabel();
        if(id < 4){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_item_images_attributes_${id}_image`});
        }
      }
    });
    $('#result').html("<%= j(render 'result_message') %>");
  });
});
