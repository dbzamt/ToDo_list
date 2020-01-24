$(document).ready(function() {
	// $("#admin_developer_view").show();

	$('#select_developers').multiselect({
	    columns:1,
	    placeholder: 'Select Languages'
	});

	$('#select_project').on('change',function(){
		fillDevelopers();
	});


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

$('#showDevProTable').on('click',function(){
	if($('#showDevProTable').text()=="Show Projects"){
		
		$("#admin_project_view").show();
		$("#admin_developer_view").hide();
	$('#showDevProTable').text("Show Developers");
	}else{
		$("#admin_project_view").hide();
		$("#admin_developer_view").show();

	$('#showDevProTable').text("Show Projects");

	}

})
$(".view_task").on('click',function(e){
	project_id = $(this).attr('project_id');
	 $.ajax({
        type: "get",
        url: "projects/"+project_id+"/tasks",
        success: function(data){
			$('#showTaskModal').modal('show');
			$('#tasks_body').empty();
			$.each(data, function(i, d) {
           		var name = d.name
	            var email = $("#email").val();

        
	            var markup = "<tr><td>"+(i+1)+"</td><td>" + d.name + "</td><td>" + d.description + "</td><td>" + d.status + "</td></tr>";
           		$('#tasks_body').append(markup);
           	});
        } 
    });
});

function change_status(task_id) {
	alert(task_id)
	// $.ajax({
 //        type: "get",
 //        url: "tasks/"+task_id+"/update_status",
 //        success: function(data){
	// 		$('#showTaskModal').modal('show');
	// 		$('#tasks_body').empty();
	// 		$.each(data, function(i, d) {
 //           		var name = d.name
	//             var email = $("#email").val();

        
	//             var markup = "<tr><td>"+(i+1)+"</td><td>" + d.name + "</td><td>" + d.description + "</td><td>" + d.status + "</td>"+'<td> <a class="change_status"  onclick="'+'change_status('+d.id+')">Change Staus</a></td></tr>';
 //           		$('#tasks_body').append(markup);
 //           	});
 //        } 
 //    });
}

function change_status_submit(argument) {
	// body...
	alert("asdf")
}