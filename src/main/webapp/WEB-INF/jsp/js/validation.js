$(function(){
   $("#formvalidation").validate({
       rules:{
    	   title:{
               required: true
           },
           first_name:{
               required: true
           },
           last_name:{
               required: true
           }
       },
       messages:{
    	   title:{
               required: 'Please enter title.'
           },
           description:{
               required: 'Please enter description.'
           }
       }
   });
});