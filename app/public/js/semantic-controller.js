var SemanticController = {
	PARSE_URL: '/parse',

	Analyze: function(text, nb_concepts, callback) {
		var result = {};
		alert('sending text');

		if (callback !== undefined)
			callback(result);
	},

	SendText: function(form) {
		var textarea = form["content-form-text"];
		var selectbox = form["content-form-resultsnb"];

		if (textarea !== undefined && selectbox !== undefined) {
			SemanticView.hideResults();
			SemanticView.showWait();
			this.Analyze(textarea.value, selectbox.value, this.ProcessResults);
		}
		else {
			SemanticView.showError('Unknown error! Please retry.');
		}

		return false;
	},

	ProcessResults: function(results) {
		SemanticView.formatResults(results);
		SemanticView.hideWait();
		SemanticView.showResults();
	}
};