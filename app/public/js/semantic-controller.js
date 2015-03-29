var SemanticController = {
	PARSE_URL: '/parse',

	Analyze: function(text, nb_concepts, callback) {
		var result = {};
		alert('sending text');

		if (callback !== undefined)
			callback(result);
	}
};