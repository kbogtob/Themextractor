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

	eraseResultLines: function() {
		$('#result-view-table > tbody:last').html('');
	},
	
	showLines: function(lines) {
		for (var i = 0; i < lines.length; ++i) {
			$('#result-view-table > tbody:last').append(lines[i]);
		}
	},

	showError: function(err) {
		alert(err);
	}
};