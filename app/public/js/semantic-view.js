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
		console.log('formatting results');
		console.log(results);
	},

	showError: function(err) {
		alert(err);
	}
};