var SemanticView = {
	hideWait: function() {
		$('#wait-view').hide();
	},

	showWait: function() {
		$('#wait-view').show();
	},

	hideResults: function() {
		$('#result-view').hide();
	},

	showResults: function() {
		$('#result-view').show();
	},

	formatResults: function(results) {
		if (results.length === 0) {
			$('#result-view-table > tbody:last')
				.append('<tr><td>0</td><td>None</td><td>0</td></tr>');
		}

		for (var i = 0; i < results.length; ++i) {
			$('#result-view-table > tbody:last')
				.append('<tr><td>'+ (i+1) +'</td><td>'+ results[i].name +'</td><td>'+ results[i].score +'</td></tr>');
		}
	},

	showError: function(err) {
		alert(err);
	}
};