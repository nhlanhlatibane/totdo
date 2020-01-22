$(function(){
   $("#formvalidation").validate({
       rules:{
    	   title:{
               required: true,
               minlength: 3
           },
           description:{
               required: true,
               minlength: 3
           }
       },
       messages:{
    	   title:{
               required: 'Please enter title.',
               minlength: 'Minimum length for this field is 3'
           },
           description:{
               required: 'Please enter description.',
               minlength: 'Minimum length for this field is 3'
           }
       }
   });
});