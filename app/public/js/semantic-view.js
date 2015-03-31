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
		$('#result-view-table > tbody:last').html('');
		if (results.length === 0) {
			$('#result-view-table > tbody:last')
				.append('<tr><td>0</td><td>None</td><td>0</td></tr>');
		}
		
		var sorted = results.sort(function(a, b) {
			if (a.score < b.score) return 1;
			if (a.score > b.score) return -1;
			return 0
		});
		
		for (var i = 0; i < sorted.length; ++i) {
			$('#result-view-table > tbody:last')
				.append('<tr><td>'+ (i+1) +'</td><td>'+ sorted[i].name +'</td><td>'+ sorted[i].score +'</td></tr>');
		}
	},

	showError: function(err) {
		alert(err);
	}
};