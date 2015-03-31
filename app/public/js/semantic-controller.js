var SemanticController = {
	PARSE_URL: '/parse',

	Analyze: function(text, nb_concepts, callback) {
		$.ajax({
			url: this.PARSE_URL,
			type: 'POST',
			data: JSON.stringify({'text':text, 'nb_concepts': nb_concepts}),
			dataType: 'json',
			contentType: 'application/json',
			success: callback,
			fail: function() {
				SemanticView.showError('Unknown error! Please retry.');
			}
		});
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

	ProcessResults: function(response) {
		if (response !== undefined || response.concepts !== undefined) {
			SemanticView.formatResults(response["concepts"]);
			SemanticView.hideWait();
			SemanticView.showResults();
		}
		else {
			SemanticView.showError('Unknown error! Please retry.');
		}
	}
};