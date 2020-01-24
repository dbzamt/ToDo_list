$(document).ready(function() {
	$('#select_developers').multiselect({
	    columns:1,
	    placeholder: 'Select Languages'
	});

	$('#select_project').on('change',function(){
		alert("yipee!");
		fillDevelopers();
	})

	$('.view_task').on('click',function(e){
		e.preventDefault();
		$('#tasks_body').empty();
		project_id = $(this).attr('project_id');
		 $.ajax({
            type: "get",
            url: "projects/"+project_id+"/tasks",
            success: function(data){
                debugger;
				$('#showTaskModal').modal('show');
				$.each(data, function(i, d) {

               		var name = d.name
            var email = $("#email").val();
            var markup = "<tr><td>"+(i+1)+"</td><td>" + d.name + "</td><td>" + d.description + "</td></tr>";
               		$('#tasks_body').append(markup);
               	});
            }
        });
	})

function fillDevelopers()
  {

    $('#select_developer').empty();
    var project_id = $('#select_project').val();
    $.ajax({
            type: "get",
            url: "/projects/get_developers",
            data: { 'project_id': project_id  },
            success: function(data){

                $('#select_developer').append('<option disabled="" selected>Select Developer</option>');
               	$.each(data, function(i, d) {

               		$('#select_developer').append('<option value="' + d.id + '">' + d.name + '</option>');
                });
            }
        });
  }
});