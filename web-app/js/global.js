function stripe(){
	jQuery('.stripe tbody tr:nth-child(even)').addClass("even"); 
	jQuery('.stripe tbody tr:nth-child(odd)').addClass("odd"); 
}

var alternateRowColors = function($table) {
	$('tbody tr:odd', $table).removeClass('even').addClass('odd');
	$('tbody tr:even', $table).removeClass('odd').addClass('even');
};	

var renameRowFields = function(table) { 
	var i = 0;
	// Iterate over each row and change the name attribute of all input/select fields
	table.find("tr.row").each(function() { 
		$(this).find("input,select").each(function() {
		    var oldName = $(this).attr('name');
		    var newName = oldName.replace(/(transactionEntries\[)(\d+)(\])/, function(f, p1, p2, p3) {
		        return p1 + i + p3;
		    });
	        $(this).attr('name', newName);
	        $(this).attr('id', newName);
			console.log(oldName + " -> " + newName);
		});
		i++;
	});
}


