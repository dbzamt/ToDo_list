$(document).ready(function() {

  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);

	$('#select_developers').multiselect({
	    columns:1,
	    placeholder: 'Select Languages'
	});

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

function fillDevelopers(){
    var project_id = $('#select_project').val();
    $.ajax({
            type: "get",
            url: "/projects/get_developers",
            data: { 'project_id': project_id  },
            success: function(data){
    			$('#select_developer').empty();
                $('#select_developer').append('<option disabled="" selected>Select Developer</option>');
               	$.each(data, function(i, d) {

               		$('#select_developer').append('<option value="' + d.id + '">' + d.name + '</option>');
                });
            }
        });
  }

  $('#select_project').on('change',function(){
		fillDevelopers();
	});


function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Task', 'Hours per Day'],
      ['Done',     5],
      ['New',      10],
      ['Progress',  2]
    ]);

    var options = {
      title: 'Project Task status',
      is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
    chart.draw(data, options);
	}