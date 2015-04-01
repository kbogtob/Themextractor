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
			SemanticController.Analyze(textarea.value, selectbox.value, SemanticController.ProcessResults);
		}
		else {
			SemanticView.showError('Unknown error! Please retry.');
		}

		return false;
	},

	ProcessResults: function(response) {
		if (response !== undefined || response.concepts !== undefined) {
			var tableLines = SemanticController.FormatResults(response["concepts"]);
			SemanticView.eraseResultLines();
			SemanticView.showLines(tableLines);
			SemanticView.hideWait();
			SemanticView.showResults();
		}
		else {
			SemanticView.showError('Unknown error! Please retry.');
		}
	},

	FormatResults: function(results) {
		var lines = [];
		
		if (results.length === 0) {
			lines.push('<tr><td>0</td><td>None</td><td>0</td></tr>');
		}
		
		var sorted = results.sort(function(a, b) {
			if (a.score < b.score) return 1;
			if (a.score > b.score) return -1;
			return 0
		});
		
		for (var i = 0; i < sorted.length; ++i) {
			lines.push('<tr><td>'+ (i+1) +'</td><td>'+ sorted[i].name +'</td><td>'+ sorted[i].score +'</td></tr>');
		}
		
		return lines;
	}
};