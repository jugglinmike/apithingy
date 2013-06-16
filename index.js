var GAPI = require("gapitoken");

var gapi = new GAPI({
	iss: '633601945905-nncbn726gjd5caq9lqbhf91rg6m28eqb@developer.gserviceaccount.com',
	scope: 'https://www.googleapis.com/auth/calendar.readonly',
	//prn: 'mike@bocoup.com',
	keyFile: 'credentials/key.pem'
}, function(err) {
	if (err) {
		console.error(err);
		return;
	}

	gapi.getToken(function(err, token) {
		if (err) {
			console.error(err);
			return;
		}
		console.log("Token:", token);
	});
});
